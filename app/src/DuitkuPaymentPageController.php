<?php

use SilverStripe\Assets\Upload;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Dev\Debug;
use SilverStripe\ORM\ValidationException;
use SilverStripe\Security\Security;

    class DuitkuPaymentPageController extends PageController{
        private static $allowed_actions = [
            'paymentmethod',
            'transaction',
            'checkTransaction'
        ];
        public function paymentmethod(HTTPRequest $request){
            // Set kode merchant anda 
            $merchantCode = "DS20031"; 
            // Set merchant key anda 
            $apiKey = "8c98ceb5b29429b26bfcd384d5f76d02";
            // catatan: environtment untuk sandbox dan passport berbeda 

            $datetime = date('Y-m-d H:i:s');  
            $paymentAmount = 10000;
            $signature = hash('sha256',$merchantCode . $paymentAmount . $datetime . $apiKey);

            $params = array(
                'merchantcode' => $merchantCode,
                'amount' => $paymentAmount,
                'datetime' => $datetime,
                'signature' => $signature
            );

            $params_string = json_encode($params);

            $url = 'https://sandbox.duitku.com/webapi/api/merchant/paymentmethod/getpaymentmethod'; 

            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL, $url); 
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params_string);                                                                  
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                'Content-Type: application/json',                                                                                
                'Content-Length: ' . strlen($params_string))                                                                       
            );   
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

            //execute post
            $request = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

            if($httpCode == 200)
            {
                $results = json_decode($request, true);
                $array = [
                    'Data'=>$results['paymentFee']
                ];
                return json_encode($array);
            }
            else{
                $request = json_decode($request);
                $error_message = "Server Error " . $httpCode ." ". $request->Message;
                echo $error_message;
            }

        }
        public function transaction(HTTPRequest $request){

            if ($request->isPOST()) {
                $postData = json_decode($request->postVar('paymentDatas'), true);
                // Debug::show($postData);
                // die();
                $finalPrice = $postData[0]['FinalPrice'];
                $paymentSelected = $postData[0]['PaymentSelected'];
                $nameCus = $postData[0]['Name'];
                $emailCus = $postData[0]['Email'];
                $numberCus = $postData[0]['Number'];
                $addressCus = $postData[0]['Address'];
                $addressDetCus = $postData[0]['AddressDetail'];
                // Debug::show($finalPrice);
                // die();
                $merchantCode = 'DS20031'; // dari duitku
                $apiKey = '8c98ceb5b29429b26bfcd384d5f76d02'; // dari duitku
                $paymentAmount = $finalPrice;
                $paymentMethod = $paymentSelected; // VC = Credit Card
                $merchantOrderId = time() . ''; // dari merchant, unik
                $productDetails = 'Tes pembayaran menggunakan Duitku';
                $email = $emailCus; // email pelanggan anda
                $phoneNumber = $numberCus; // nomor telepon pelanggan anda (opsional)
                $additionalParam = ''; // opsional
                $merchantUserInfo = ''; // opsional
                $customerVaName = $nameCus; // tampilan nama pada tampilan konfirmasi bank
                $callbackUrl = '{$BaseHref}/duitkupayment/callback'; // url untuk callback
                $returnUrl = '{$BaseHref}/purhace'; // url untuk redirect
                $expiryPeriod = 10; // atur waktu kadaluarsa dalam hitungan menit
                $signature = md5($merchantCode . $merchantOrderId . $paymentAmount . $apiKey);
                $paymentData = [
                    'MerchantCode' => $merchantCode,
                    'ApiKey' => $apiKey,
                    'PaymentAmount' => $paymentAmount,
                    'PaymentMethod' => $paymentMethod,
                    'MerchantOrderId' => $merchantOrderId,
                    'ProductDetails' => $productDetails,
                    'Email' => $email,
                    'PhoneNumber' => $phoneNumber,
                    'AdditionalParam' => $additionalParam,
                    'MerchantUserInfo' => $merchantUserInfo,
                    'CustomerVaName' => $customerVaName,
                    'CallbackUrl' => $callbackUrl,
                    'ReturnUrl' => $returnUrl,
                    'ExpiryPeriod' => $expiryPeriod,
                    'Signature' => $signature,
                ];
                // Customer Detail
                $firstName = $nameCus;
                $lastName = "";
    
                // Address
                $alamat = $addressCus;
                $city = $addressDetCus;
                $postalCode = "";
                $countryCode = "ID";
    
                $address = array(
                    'firstName' => $firstName,
                    'lastName' => $lastName,
                    'address' => $alamat,
                    'city' => $city,
                    'postalCode' => $postalCode,
                    'phone' => $phoneNumber,
                    'countryCode' => $countryCode
                );
    
                $customerDetail = array(
                    'firstName' => $firstName,
                    'lastName' => $lastName,
                    'email' => $email,
                    'phoneNumber' => $phoneNumber,
                    'billingAddress' => $address,
                    'shippingAddress' => $address
                );
    
                // $item1 = array(
                //     'name' => 'Test Item 1',
                //     'price' => 0,
                //     'quantity' => 1);
    
                // $item2 = array(
                //     'name' => 'Test Item 2',
                //     'price' => 1777000,
                //     'quantity' => 3);
    
                // $itemDetails = array(
                //     $item1, $item2
                // );
    
                /*Khusus untuk metode pembayaran OL dan SL
                $accountLink = array (
                    'credentialCode' => '7cXXXXX-XXXX-XXXX-9XXX-944XXXXXXX8',
                    'ovo' => array (
                        'paymentDetails' => array ( 
                            0 => array (
                                'paymentType' => 'CASH',
                                'amount' => 40000,
                            ),
                        ),
                    ),
                    'shopee' => array (
                        'useCoin' => false,
                        'promoId' => '',
                    ),
                );*/
    
                /*Khusus untuk metode pembayaran Kartu Kredit
                $creditCardDetail = array (
                    'acquirer' => '014',
                    'binWhitelist' => array (
                        '014',
                        '400000'
                    )
                );*/
    
                $params = array(
                    'merchantCode' => $merchantCode,
                    'paymentAmount' => $paymentAmount,
                    'paymentMethod' => $paymentMethod,
                    'merchantOrderId' => $merchantOrderId,
                    'productDetails' => $productDetails,
                    'additionalParam' => $additionalParam,
                    'merchantUserInfo' => $merchantUserInfo,
                    'customerVaName' => $customerVaName,
                    'email' => $email,
                    'phoneNumber' => $phoneNumber,
                    //'accountLink' => $accountLink,
                    //'creditCardDetail' => $creditCardDetail,
                    // 'itemDetails' => $itemDetails,
                    'customerDetail' => $customerDetail,
                    'callbackUrl' => $callbackUrl,
                    'returnUrl' => $returnUrl,
                    'signature' => $signature,
                    'expiryPeriod' => $expiryPeriod
                );
    
                $params_string = json_encode($params);
                //echo $params_string;
                $url = 'https://sandbox.duitku.com/webapi/api/merchant/v2/inquiry'; // Sandbox
                // $url = 'https://passport.duitku.com/webapi/api/merchant/v2/inquiry'; // Production
                $ch = curl_init();
    
                curl_setopt($ch, CURLOPT_URL, $url); 
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
                curl_setopt($ch, CURLOPT_POSTFIELDS, $params_string);                                                                  
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
                curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                    'Content-Type: application/json',                                                                                
                    'Content-Length: ' . strlen($params_string))                                                                       
                );   
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
                //execute post
                $request = curl_exec($ch);
                $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                
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
                            $orderID = $merchantOrderId;
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
                                'OrderID' => $merchantOrderId,
                                'Bank' => $product['Bank'],
                                'Comments' => $product['Comments'],
                                'TimeCheckout' => $product['TimeCheckout']
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
                                $checkoutItem->merchantOrderId = $merchantOrderId;
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
                                Debug::show("iso2");
                            }
                        }
                    }
                } else {
                    Debug::show("gaiso");
                }
                if($httpCode == 200)
                {
                    $result = json_decode($request, true);
                    echo json_encode($result);
                }
                else
                {
                    $request = json_decode($request);
                    $error_message = "Server Error " . $httpCode ." ". $request->Message;
                    echo $error_message;
                }
            }
        }
        public function callback(){
            $apiKey = '8c98ceb5b29429b26bfcd384d5f76d02'; // API key anda
            $merchantCode = isset($_POST['merchantCode']) ? $_POST['merchantCode'] : null; 
            $amount = isset($_POST['amount']) ? $_POST['amount'] : null; 
            $merchantOrderId = isset($_POST['merchantOrderId']) ? $_POST['merchantOrderId'] : null; 
            $productDetail = isset($_POST['productDetail']) ? $_POST['productDetail'] : null; 
            $additionalParam = isset($_POST['additionalParam']) ? $_POST['additionalParam'] : null; 
            $paymentMethod = isset($_POST['paymentCode']) ? $_POST['paymentCode'] : null; 
            $resultCode = isset($_POST['resultCode']) ? $_POST['resultCode'] : null; 
            $merchantUserId = isset($_POST['merchantUserId']) ? $_POST['merchantUserId'] : null; 
            $reference = isset($_POST['reference']) ? $_POST['reference'] : null; 
            $signature = isset($_POST['signature']) ? $_POST['signature'] : null; 
            $publisherOrderId = isset($_POST['publisherOrderId']) ? $_POST['publisherOrderId'] : null; 
            $spUserHash = isset($_POST['spUserHash']) ? $_POST['spUserHash'] : null; 
            $settlementDate = isset($_POST['settlementDate']) ? $_POST['settlementDate'] : null; 
            $issuerCode = isset($_POST['issuerCode']) ? $_POST['issuerCode'] : null; 

            //log callback untuk debug 
            // file_put_contents('callback.txt', "* Callback *\r\n", FILE_APPEND | LOCK_EX);

            if(!empty($merchantCode) && !empty($amount) && !empty($merchantOrderId) && !empty($signature))
            {
                $params = $merchantCode . $amount . $merchantOrderId . $apiKey;
                $calcSignature = md5($params);

                if($signature == $calcSignature)
                {
                    die("sukses");
                    //Callback tervalidasi
                    //Silahkan rubah status transaksi anda disini
                    // file_put_contents('callback.txt', "* Success *\r\n\r\n", FILE_APPEND | LOCK_EX);

                }
                else
                {
                    // file_put_contents('callback.txt', "* Bad Signature *\r\n\r\n", FILE_APPEND | LOCK_EX);
                    throw new Exception('Bad Signature');
                }
            }
            else
            {
                // file_put_contents('callback.txt', "* Bad Parameter *\r\n\r\n", FILE_APPEND | LOCK_EX);
                throw new Exception('Bad Parameter');
            }
        }
        public function checkTransaction(){
            $merchantCode = 'DS20031'; // dari duitku
            $apiKey = '8c98ceb5b29429b26bfcd384d5f76d02'; // dari duitku
            if (isset($_GET['orderid'])) {
                $merchantOrderId = $_GET['orderid'];
            } else {
                Debug::show("Order ID tidak ditemukan.");
                return;
            }

            $signature = md5($merchantCode . $merchantOrderId . $apiKey);

            $params = array(
                'merchantCode' => $merchantCode,
                'merchantOrderId' => $merchantOrderId,
                'signature' => $signature
            );

            $params_string = json_encode($params);
            $url = 'https://sandbox.duitku.com/webapi/api/merchant/transactionStatus';
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL, $url); 
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params_string);                                                                  
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                'Content-Type: application/json',                                                                                
                'Content-Length: ' . strlen($params_string))                                                                       
            );   
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

            //execute post
            $request = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

            if($httpCode == 200)
            {
                $results = json_decode($request, true);
                print_r($results, false);
                echo "merchantOrderId :". $results['merchantOrderId'] . "<br />";
                echo "reference :". $results['reference'] . "<br />";
                echo "amount :". $results['amount'] . "<br />";
                echo "fee :". $results['fee'] . "<br />";
                echo "statusCode :". $results['statusCode'] . "<br />";
                echo "statusMessage :". $results['statusMessage'] . "<br />";
            }
            else
            {
                $request = json_decode($request);
                $error_message = "Server Error " . $httpCode ." ". $request->Message;
                echo $error_message;
            }
        }
    }