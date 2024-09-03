<?php

use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Dev\Debug;
use SilverStripe\Security\IdentityStore;
use SilverStripe\Security\Member;
use SilverStripe\Security\Security;
use SilverStripe\View\ViewableData;

class HomePageController extends PageController {
    protected function init() {
        parent::init();
        $member = Security::getCurrentUser();
        if (!$member) {
            return $this->redirect('login');
        }
    }
    private static $allowed_actions = [
        'logout'
    ];
    public function index(HTTPRequest $request){
        $categories = ProductCategory::get();
        $data = [
            'Categories' => $categories
        ];
        return $data;
        
    }
    public function PromotionObjects() {
        return PromotionObject::get();
    }
    public function ProductObjects() {
        return ProductObject::get();
    }
    public function ProductCategories() {
        return ProductCategory::get();
    }
    public function ProductSubCategories() {
        return ProductObject::get();
    }
    public function getMember() {
        $member = Security::getCurrentUser();
        if ($member) {
            return $member;
        }
        return null;
    }
    public function CartData() {
        $member = Security::getCurrentUser();
        if ($member) {
            $totalCart = CartObject::get()->filter('MemberID', $member->ID)->count();
            return $totalCart;
        }
        return null;
    }
    
    
    public function logout(HTTPRequest $request) {
        if ($request) {
            Injector::inst()->get(IdentityStore::class)->logout();
            return json_encode([
                'status' => 'success',
                'redirect' => '/project3/login'
            ]);
        }
        return $this->httpError(400, 'Bad request');
    }
}