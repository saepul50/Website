    <?php

    use SilverStripe\Control\Controller;
    use SilverStripe\Control\HTTPRequest;
    use SilverStripe\Dev\Debug;
    use SilverStripe\Security\Security;
    use SilverStripe\ORM\ValidationException;

    class CartPageController extends PageController {
        protected function init() {
            parent::init();
            $member = Security::getCurrentUser();
            if (!$member) {
                return $this->redirect('login');
            }
        }
        private static $allowed_actions = [
            'cart',
            'remove'
        ];
        public function getMember() {
            $member = Security::getCurrentUser();
            if ($member) {
                return $member;
            }
            return null;
        }
        public function cart(HTTPRequest $request) {
            if ($request) {
                $ProductID = $request->postVar('ProductID');
                $ProductTitle = $request->postVar('ProductTitle');
                $ProductImage = $request->postVar('ProductImage');
                $VariantName = $request->postVar('VariantName');
                $VariantID = $request->postVar('VariantID');
                $Price = $request->postVar('Price');
                $Quantity = $request->postVar('Quantity');
                $Price = str_replace(['Rp. ', '.', '.', '.', '.'], '', $Price);
                
                $data = [
                    'ProductID' => $ProductID,
                    'ProductTitle' => $ProductTitle,
                    'ProductImage' => $ProductImage,
                    'VariantName' => $VariantName,
                    'VariantID' => $VariantID,
                    'Price' => $Price,
                    'Quantity' => $Quantity
                ];
                
                try {
                    $existingCartItem = CartObject::get()
                        ->filter('VariantID', $VariantID)
                        ->filter('MemberID', Security::getCurrentUser()->ID)
                        ->first();
                    
                    if ($existingCartItem) {
                        $existingCartItem->Quantity += $Quantity;
                        $existingCartItem->write();
                    } else {
                        $cartItem = CartObject::create();
                        $cartItem->ProductID = $ProductID;
                        $cartItem->ProductTitle = $ProductTitle;
                        $cartItem->ProductImage = $ProductImage;
                        $cartItem->VariantName = $VariantName;
                        $cartItem->VariantID = $VariantID;
                        $cartItem->Price = $Price;
                        $cartItem->Quantity = $Quantity;
                        $member = Security::getCurrentUser();
                        if ($member) {
                            $cartItem->MemberID = $member->ID;
                        }
                        $cartItem->write();
                    }
                    
                    return json_encode(['success' => true]);
                } catch (ValidationException $e) {
                    return json_encode(['success' => false, 'message' => $e->getMessage()]);
                }
            }
            return $this->httpError(405, 'Method Not Allowed');
        }        
        public function remove(HTTPRequest $request) {
            if ($request) {
                $IDs = $request->postVar('ID') ? [$request->postVar('ID')] : $request->postVar('IDs');
        
                if (is_array($IDs)) {
                    $success = true;
                    foreach ($IDs as $ID) {
                        $cartItem = CartObject::get()->byID($ID);
                        if ($cartItem && $cartItem->MemberID == Security::getCurrentUser()->ID) {
                            $cartItem->delete();
                        } else {
                            $success = false;
                        }
                    }
                    return json_encode(['success' => $success]);
                } else {
                    $cartItem = CartObject::get()->byID($IDs);
                    if ($cartItem && $cartItem->MemberID == Security::getCurrentUser()->ID) {
                        $cartItem->delete();
                        return json_encode(['success' => true]);
                    }
                    return json_encode(['success' => false, 'message' => 'Item not found or permission denied']);
                }
            }
            return $this->httpError(405, 'Method Not Allowed');
        }               
        
        public function ProductData() {
            $member = Security::getCurrentUser();
            if ($member) {
                return CartObject::get()->filter('MemberID', $member->ID);
            }
            return null;
        }
    }