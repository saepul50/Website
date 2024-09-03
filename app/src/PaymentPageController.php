<?php

use SilverStripe\Assets\Image;
use SilverStripe\Assets\Upload;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Dev\Debug;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\ValidationException;
use SilverStripe\Security\Security;

    class PaymentPageController extends PageController{
        private static $allowed_actions = [
            'index',
            'staticpayment',
            'paymentstate',
        ];
        public function index(HTTPRequest $request)
        {
            $paymentData = $request->getSession()->get('PaymentData');
            $listDataPayment = new ArrayList();
            
            if ($paymentData && is_array($paymentData)) {
                foreach ($paymentData as $data) {
                    $listDataPayment->push($data);
                }
            }
            return $this->customise([
                'PaymentData' => $listDataPayment
            ])->renderWith(['PaymentPage', 'Page']);
        }
        public function staticpayment(HTTPRequest $request)
        {
            if ($request->isPOST()) {
                $postData = $request->postVar('paymentDatas');
                $bankImageFile = isset($_FILES['bankImage']) ? $_FILES['bankImage'] : null;

                $payments = json_decode($postData, true);
                // Debug::show($payments);
                // die();
                if (is_array($payments)) {
                    $results = [];

                    if (!empty($payments)) {
                        foreach ($payments as $payment) {
                            $CartID = $payment['CartID'];
                            $ProductID = $payment['ProductID'];
                            $ProductTitle = $payment['ProductTitle'];
                            $ProductImage = $payment['ProductImage'];
                            $VariantName = $payment['VariantName'];
                            $VariantID = $payment['VariantID'];
                            $Price = $payment['Price'];
                            $TotalPrice = $payment['SubTotalPrice'];
                            $Quantity = $payment['Quantity'];
                            $FinalPrice = $payment['FinalPrice'];
                            $Name = $payment['Name'];
                            $CustomerNumber = $payment['Number'];
                            $Address = $payment['Address'];
                            $AddressDetail = $payment['AddressDetail'];
                            $OrderID = $payment['OrderID'];
                            $Bank = $payment['Bank'];
                            $BankRek = $payment['BankRek'];
                            // Debug::show($CustomerNumber);
                            // die();
                            try {
                                $paymentItem = PaymentObject::create();
                                $paymentItem->CartID = $CartID;
                                $paymentItem->ProductID = $ProductID;
                                $paymentItem->ProductTitle = $ProductTitle;
                                $paymentItem->ProductImage = $ProductImage;
                                $paymentItem->VariantName = $VariantName;
                                $paymentItem->VariantID = $VariantID;
                                $paymentItem->Price = $Price;
                                $paymentItem->TotalPrice = $TotalPrice;
                                $paymentItem->Quantity = $Quantity;
                                $paymentItem->FinalPrice = $FinalPrice;
                                $paymentItem->Name = $Name;
                                $paymentItem->CustomerNumber = $CustomerNumber;
                                $paymentItem->Address = $Address;
                                $paymentItem->AddressDetail = $AddressDetail;
                                $paymentItem->OrderID = $OrderID;
                                $paymentItem->Bank = $Bank;
                                $paymentItem->BankRek = $BankRek;

                                $member = Security::getCurrentUser();
                                if ($member) {
                                    $paymentItem->MemberID = $member->ID;
                                }

                                if ($bankImageFile && $bankImageFile['error'] === UPLOAD_ERR_OK) {
                                    $upload = new Upload();
                                    $img = new Image();
                                    $upload->loadIntoFile($bankImageFile, $img);
                                    if (!$upload->isError()) {
                                        $paymentItem->BankImgID = $img->ID;
                                    } else {
                                        $results[] = ['success' => false, 'productID' => $ProductID, 'message' => $upload->getErrors()];
                                        continue;
                                    }
                                }

                                $paymentItem->write();
                                $results[] = ['success' => true, 'productID' => $ProductID];
                            } catch (ValidationException $e) {
                                $results[] = ['success' => false, 'productID' => $ProductID, 'message' => $e->getMessage()];
                            }
                        }

                        return json_encode(['success' => true, 'results' => $results]);
                    } else {
                        return json_encode(['success' => false, 'message' => 'Empty data received']);
                    }
                } else {
                    return json_encode(['success' => false, 'message' => 'Invalid data format']);
                }
            }

            return json_encode(['success' => false, 'message' => 'No data received']);
        }


        public function paymentstate(HTTPRequest $request) {
            $orderID = $request->param('ID');
            $product = PaymentObject::get()->filter(['OrderID' => $orderID]);
            return $this->customise(['Product' => $product])->renderWith(['PaymentPage', 'Page']);
        }
    }