<?php

use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Control\HTTPResponse;
use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Security;

class PromotionObjectController extends Controller {
    private static $allowed_actions = [];

    protected function init() {
        parent::init();
        $member = Security::getCurrentUser();
        if (!$member) {
            return $this->redirect('login');
        }
    }
    public function PromotionObjects() {
        return PromotionObject::get();
    }
}
