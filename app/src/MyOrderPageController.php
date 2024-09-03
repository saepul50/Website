<?php

use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Dev\Debug;
use SilverStripe\Security\Security;

    class MyOrderPageController extends PageController{
        private static $allowed_actions = [
            'order'
        ];
        protected function init() {
            parent::init();
            $member = Security::getCurrentUser();
            if (!$member) {
                return $this->redirect('login');
            }
        }
        public function HeaderCheckout() {
            $member = Security::getCurrentUser();
            if ($member) {
                $checkoutObjects = CheckoutObject::get()->filter('MemberID', $member->ID);
                $headerCheckoutIDs = $checkoutObjects->column('HeaderCheckoutID');
                return CheckoutHeaderObject::get()->filter('ID', $headerCheckoutIDs);
            }
            return null;
        }
        public function getMember() {
            $member = Security::getCurrentUser();
            if ($member) {
                return $member;
            }
            return null;
        }
        public function order(HTTPRequest $request) {
            // die("da");
            // Debug::show($request);
            // die();      
            $id = $request->param('ID');
            $member = Security::getCurrentUser();
            if ($member) {
                $checkoutObjects = CheckoutObject::get()->filter('MemberID', $member->ID);
                $headerCheckoutIDs = $checkoutObjects->column('HeaderCheckoutID');
        
                $checkoutHeader = CheckoutHeaderObject::get()->filter(['OrderID' => $id])->filter('ID', $headerCheckoutIDs);
                // Debug::show($checkoutHeader);
                // die();
                if ($checkoutHeader->exists()) {
                    $isDetail = $request->getVar('detailOrder');
                    return $this->customise([
                        'CheckoutHeader' => $checkoutHeader,
                        'ShowDetailOrder' => $isDetail
                    ])->renderWith(['MyOrderPage', 'Page']);
                }
            }
        }
        
    }