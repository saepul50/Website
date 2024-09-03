<?php

use SilverStripe\Control\HTTPRequest;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextAreaField;
use SilverStripe\Forms\FormAction;
use SilverStripe\Dev\Debug;
use SilverStripe\Security\Security;

class ProductPageController extends PageController {
    protected function init() {
        parent::init();
        $member = Security::getCurrentUser();
        if (!$member) {
            return $this->redirect('login');
        }
    }
    private static $allowed_actions = [
        'view'
    ];
    public function view(HTTPRequest $request) {
        $id = $request->param('ID');
        $product = ProductObject::get()->byID($id);
        
        return $this->customise(['Product' => $product])->renderWith(['ProductPage', 'Page']);
    }
}
