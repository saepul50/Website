<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;

class ProductCategory extends DataObject {
    private static $db = [
        'Title' => 'Varchar',
    ];

    private static $has_one = [
        'ProductSubCategory' => ProductSubCategory::class,
    ];
    public function getCMSFields() {
        $fields = new FieldList(
            TextField::create('Title')
        );
        return $fields;
    }
}
