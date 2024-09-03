<?php
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DropdownField;

class ProductSubCategory extends DataObject {
    private static $db = [
        'Title' => 'Varchar'
    ];

    private static $has_one = [
        'ProductCategory' => ProductCategory::class
    ];
    public function getCMSFields() {
        $categories = ProductCategory::get()->map('ID', 'Title')->toArray();
        $fields = new FieldList(
            TextField::create('Title'),
            DropdownField::create('ProductCategoryID', 'Category', $categories)
                ->setEmptyString('Select a Category'),
        );
        return $fields;
    }
}
