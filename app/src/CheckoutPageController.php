<?php

use Duitku\Config;
use Duitku\Pop;
use Dotenv\Dotenv;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\Upload;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Dev\Debug;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\ValidationException;
use SilverStripe\Security\Security;

class CheckoutPageController extends PageController
{
    private static $allowed_actions = [
        'index',
        'static',
        'state',
        'address',
        'cash'
    ];
    protected function init() {
        parent::init();
        $member = Security::getCurrentUser();
        if (!$member) {
            return $this->redirect('login');
        }
    }
    public function index(HTTPRequest $request)
    {
        $checkoutData = $request->getSession()->get('CheckoutData');
        $AddressData = $request->getSession()->get('AddressData');
        $listDataCheckout = new ArrayList();
        
        if ($checkoutData && is_array($checkoutData)) {
            foreach ($checkoutData as $data) {
                $listDataCheckout->push($data);
            }
        }

        return $this->customise([
            'CheckoutData' => $listDataCheckout,
            'AddressData' => $AddressData
        ])->renderWith(['CheckoutPage', 'Page']);
    }


    public function static(HTTPRequest $request)
    {
        if ($request->isPOST()) {
            $postData = $request->postVar('products');
            // Debug::show($postData);
            // die();
            if (is_array($postData)) {
                $products = $postData;
                
                if (!empty($products)) {
                    $checkoutData = [];

                    foreach ($products as $product) {
                        $productData = [
                            'ProductID' => $product['ProductID'],
                            'ProductTitle' => $product['ProductTitle'],
                            'ProductImage' => $product['ProductImage'],
                            'VariantName' => $product['VariantName'],
                            'VariantID' => $product['VariantID'],
                            'Price' => $product['Price'],
                            'TotalPrice' => $product['TotalPrice'],
                            'Quantity' => $product['Quantity'],
                        ];
                        // Debug::show($productData);
                        // die();
                        if (isset($product['CartID'])) {
                            $productData['CartID'] = $product['CartID'];
                        }
                        
                        $checkoutData[] = $productData;
                    }

                    $request->getSession()->set('CheckoutData', $checkoutData);

                    return json_encode(['success' => true]);
                } else {
                    return json_encode(['success' => false, 'message' => 'Empty data received']);
                }
            } else {
                return json_encode(['success' => false, 'message' => 'Nothing Item Checkout']);
            }
        }
        
        return json_encode(['success' => false, 'message' => 'No data received']);
    }
    public function address(HTTPRequest $request){
            if ($request) {
            $Number = $request->postVar('Number');
            $Name = $request->postVar('Name');
            $Address = $request->postVar('Address');
            $AddressDetail = $request->postVar('AddressDetail');

            if (!empty($Number) && !empty($Name) && !empty($Address) && !empty($AddressDetail)) {
                $data = [
                    'Number' => $Number,
                    'Name' => $Name,
                    'Address' => $Address,
                    'AddressDetail' => $AddressDetail
                ];
                
                $request->getSession()->set('AddressData', $data);

                return json_encode(['success' => true]);
            } else {
                return json_encode(['success' => false, 'message' => 'Incomplete data received']);
            }
        }

        return json_encode(['success' => false, 'message' => 'No data received']);
    }


    public function state(HTTPRequest $request) {
        // Debug::show($_REQUEST);
        if ($request->isPOST()) {
            $postData = json_decode($request->postVar('data'), true);
            if ($postData) {
                $products = $postData;
                    // Debug::show($products);
                    // die();
                if (!empty($products)) {
                    $results = [];
                    $firstItemProcessed = false;
                    
                    foreach ($products as $product) {
                        // Debug::show($_FILES['ProofImage']);
                        // die();
                        $productID = $product['ProductID'];
                        $cartID = $product['CartID'];
                        $productTitle = $product['ProductTitle'];
                        $productImage = $product['ProductImage'];
                        $variantName = $product['VariantName'];
                        $variantID = $product['VariantID'];
                        $price = $product['Price'];
                        $subTotalPrice = $product['SubTotalPrice'];
                        $quantity = $product['Quantity'];
                        $finalPrice = $product['FinalPrice'];
                        $name = $product['Name'];
                        $number = $product['Number'];
                        $address = $product['Address'];
                        $addressDetail = $product['AddressDetail'];
                        $orderID = $product['OrderID'];
                        $bank = $product['Bank'];
                        $comments = $product['Comments'];
                        $timeCheckout = $product['TimeCheckout'];
                        $paymentMethod = $product['PaymentMethod'];
                        
                        try {
                            $checkoutItem = CheckoutObject::create();
                            $checkoutItem->ProductID = $productID;
                            $checkoutItem->CartID = $cartID;
                            $checkoutItem->ProductTitle = $productTitle;
                            $checkoutItem->ProductImage = $productImage;
                            $checkoutItem->VariantName = $variantName;
                            $checkoutItem->VariantID = $variantID;
                            $checkoutItem->Price = $price;
                            $checkoutItem->TotalPrice = $subTotalPrice;
                            $checkoutItem->Quantity = $quantity;
                            $checkoutItem->FinalPrice = $finalPrice;
                            $member = Security::getCurrentUser();
                            if ($member) {
                                $checkoutItem->MemberID = $member->ID;
                            }
                            if (!$firstItemProcessed) {
                                $checkoutHeader = CheckoutHeaderObject::create();
                                $checkoutHeader->OrderID = $orderID;
                                $checkoutHeader->Name = $name;
                                $checkoutHeader->Number = $number;
                                $checkoutHeader->Address = $address;
                                $checkoutHeader->AddressDetail = $addressDetail;
                                $checkoutHeader->FinalPrice = $finalPrice;
                                $checkoutHeader->Bank = $bank;
                                $checkoutHeader->Message = $comments;
                                $checkoutHeader->TimeCheckout = $timeCheckout;
                                $checkoutHeader->PaymentMethod = $paymentMethod;
                                if(isset($_FILES['ProofImage'])){
                                    $upload = new Upload();
                                    $img = new Image();
                                    $upload->loadIntoFile($_FILES['ProofImage'], $img);
                                    
                                    if (!$upload->isError()) {
                                        $checkoutHeader->ProofImage = $img->ID;
                                    }
                                }
                                $checkoutHeader->write();
                                $firstItemProcessed = true;
                            }
                            $checkoutItem->HeaderCheckoutID = $checkoutHeader->ID;
                            $checkoutItem->write();
                            
                            $cartItem = CartObject::get()->byID($cartID);
                            if ($cartItem) {
                                $cartItem->delete();
                            }
                            $results[] = ['success' => true, 'productID' => $productID];
                        } catch (ValidationException $e) {
                            $results[] = ['success' => false, 'productID' => $productID, 'message' => $e->getMessage()];
                        }
                    }
    
                    if (count($results) === count($products)) {
                        return json_encode(['success' => true, 'results' => $results]);
                    } else {
                        return json_encode(['success' => false, 'results' => $results]);
                    }
                } else {
                    return json_encode(['success' => false, 'message' => 'Empty data received']);
                }
            } else {
                return json_encode(['success' => false, 'message' => 'Invalid data format']);
            }
        }
    
        return json_encode(['success' => false, 'message' => 'No data received']);
    }    
    public function cash(HTTPRequest $request){
        if ($request->isPOST()) {
            $postData = json_decode($request->postVar('paymentDatas'), true);
            if ($postData) {
                $products = $postData;
                // Debug::show($products);
                // die();
                if (!empty($products)) {
                    $firstItemProcessed = false;
                    
                    foreach ($products as $product) {
                        // Debug::show($_FILES['ProofImage']);
                        // die();
                        $productID = $product['ProductID'];
                        $cartID = $product['CartID'];
                        $productTitle = $product['ProductTitle'];
                        $productImage = $product['ProductImage'];
                        $variantName = $product['VariantName'];
                        $variantID = $product['VariantID'];
                        $price = $product['Price'];
                        $subTotalPrice = $product['SubTotalPrice'];
                        $quantity = $product['Quantity'];
                        $finalPrice = $product['FinalPrice'];
                        $name = $product['Name'];
                        $number = $product['Number'];
                        $address = $product['Address'];
                        $addressDetail = $product['AddressDetail'];
                        $orderID = $product['OrderID'];
                        $bank = $product['Bank'];
                        $comments = $product['Comments'];
                        $timeCheckout = $product['TimeCheckout'];
                        $paymentMethod = $product['PaymentMethod'];

                        $debugData = [
                            'ProductID' => $product['ProductID'],
                            'CartID' => $product['CartID'],
                            'ProductTitle' => $product['ProductTitle'],
                            'ProductImage' => $product['ProductImage'],
                            'VariantName' => $product['VariantName'],
                            'VariantID' => $product['VariantID'],
                            'Price' => $product['Price'],
                            'SubTotalPrice' => $product['SubTotalPrice'],
                            'Quantity' => $product['Quantity'],
                            'FinalPrice' => $product['FinalPrice'],
                            'Name' => $product['Name'],
                            'Number' => $product['Number'],
                            'Address' => $product['Address'],
                            'AddressDetail' => $product['AddressDetail'],
                            'OrderID' => $orderID,
                            'Bank' => $product['Bank'],
                            'Comments' => $product['Comments'],
                            'TimeCheckout' => $product['TimeCheckout'],
                            'PaymentMethod' => $product['PaymentMethod'],
                        ];                
                        // Debug::show($debugData);
                        // die();           
                        
                        try {
                            $checkoutItem = CheckoutObject::create();
                            $checkoutItem->ProductID = $productID;
                            $checkoutItem->CartID = $cartID;
                            $checkoutItem->ProductTitle = $productTitle;
                            $checkoutItem->ProductImage = $productImage;
                            $checkoutItem->VariantName = $variantName;
                            $checkoutItem->VariantID = $variantID;
                            $checkoutItem->Price = $price;
                            $checkoutItem->TotalPrice = $subTotalPrice;
                            $checkoutItem->Quantity = $quantity;
                            $checkoutItem->FinalPrice = $finalPrice;
                            $checkoutItem->merchantOrderId = $orderID;
                            $member = Security::getCurrentUser();
                            if ($member) {
                                $checkoutItem->MemberID = $member->ID;
                            }
                            if (!$firstItemProcessed) {
                                $checkoutHeader = CheckoutHeaderObject::create();
                                $checkoutHeader->OrderID = $orderID;
                                $checkoutHeader->Name = $name;
                                $checkoutHeader->Number = $number;
                                $checkoutHeader->Address = $address;
                                $checkoutHeader->AddressDetail = $addressDetail;
                                $checkoutHeader->FinalPrice = $finalPrice;
                                $checkoutHeader->Bank = $bank;
                                $checkoutHeader->Message = $comments;
                                $checkoutHeader->TimeCheckout = $timeCheckout;
                                $checkoutHeader->PaymentMethod = $paymentMethod;
                                $checkoutHeader->write();
                                $firstItemProcessed = true;
                            }
                            $checkoutItem->HeaderCheckoutID = $checkoutHeader->ID;
                            $checkoutItem->write();
                            
                            $cartItem = CartObject::get()->byID($cartID);
                            if ($cartItem) {
                                $cartItem->delete();
                            }
                        } catch (ValidationException $e) {
                            Debug::show("iso");
                        }
                    }
                }
            } else {
                Debug::show("gaiso");
            }
        }
    }
    public function states(HTTPRequest $request){
        if($request->isPost()){
            $postData = json_decode($request->postVar('data'), true);
            if ($postData) {
                $products = $postData;
                if (!empty($products)) {
                    
                }
            }
        }
    }
    public function getMemberEmail() {
        $member = Security::getCurrentUser();
        return $member ? $member->Email : 'Guest';
    }
    
    public function getMemberName() {
        $member = Security::getCurrentUser();
        return $member ? $member->FirstName : 'Guest';
    }
    public function getMember() {
        $member = Security::getCurrentUser();
        if ($member) {
            return $member;
        }
        return null;
    }
}
