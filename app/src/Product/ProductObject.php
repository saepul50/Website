<?php

use Sheadawson\DependentDropdown\Forms\DependentDropdownField;
use SilverStripe\ORM\DataObject;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\File;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextAreaField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridFieldDataColumns;

class ProductObject extends DataObject {
    private static $db = [
        'Title' => 'Text',
        'Description'=> 'Text',
        'Information'=> 'Text',
        'Rating' => 'Decimal',
        'QuantitySold' => 'Int'
    ];
    private static $summary_fields = [
        'Title' => 'Product Name',
        'FirstProductImage' => 'Product Image'
    ];
    private static $has_one = [
        'ProductVideo' => File::class,
        'ProductCategory' => ProductCategory::class,
        'ProductSubCategory' => ProductSubCategory::class
    ];

    private static $many_many = [
        'ProductImages' => Image::class,
    ];

    private static $owns = [
        'ProductImages',
        'ProductVideo'
    ];

    private static $has_many = [
        'ProductVariants' => ProductVariantObject::class
    ];
    public function getFirstProductImage() {
        if ($this->ProductImages()->exists()) {
            $image = $this->ProductImages()->first();
            return $image->Thumbnail(100, 100);
        }
        return null;
    }
    public function getVariant(){
        return $this->ProductVariants();
    }
    
    public function getLink() {
        $page = ProductPage::get()->first();
        if ($page) {
            $link = $page->Link('view/' . $this->ID);
            return $link;
        }
        return null;
    }
    public function rangePrice() {
        $variants = $this->ProductVariants();
        if ($variants->exists()) {
            $prices = $variants->column('Price');
            $minPrice = min($prices);
            $maxPrice = max($prices);
            if($minPrice == $maxPrice) {
                return 'Rp. ' . number_format($maxPrice, 0, '', '.');
            }
            return 'Rp. ' . number_format($minPrice, 0, '', '.') . ' - Rp. ' . number_format($maxPrice, 0, '', '.');
        }
        return 'No price available';
    }
    public function minPrice() {
        $variants = $this->ProductVariants();
        if ($variants->exists()) {
            $prices = $variants->column('Price');
            $minPrice = min($prices);
            return 'Rp. ' . number_format($minPrice, 0, '', '.');
        }
        return 'No price available';
    }
    public function totalStock() {
        $variants = $this->ProductVariants();
        if ($variants->exists()) {
            $totalStock = $variants->sum('Stock');
            return $totalStock;
        }
        return 'Out of Stock';
    }
    public function validate() {
        $result = parent::validate();

        if ($this->ProductVariants()->count() === 0) {
            $result->addMessage('You must add at least one variant before saving this product.');
        }

        return $result;
    }
    public function getCMSFields() {
        $categories = ProductCategory::get()->map('ID', 'Title')->toArray();
        $fields = new FieldList(
            TextField::create('Title', 'Product Name'),
            TextField::create('Rating'),
            TextAreaField::create('Description'),
            TextAreaField::create('Information'),
            UploadField::create('ProductImages', 'Product Images')
                ->setAllowedFileCategories('image/supported')
                ->setIsMultiUpload(true),
            UploadField::create('ProductVideo'),
            $categoryField = DropdownField::create('ProductCategoryID', 'Category', $categories)
                ->setEmptyString('Select a Category'),
            DependentDropdownField::create('ProductSubCategoryID', 'Sub Category', function($val) {
                if ($val) {
                    return ProductSubCategory::get()->filter('ProductCategoryID', $val)->map('ID', 'Title');
                }
                return [];
            })->setDepends($categoryField),
            GridField::create(
                'ProductVariants',
                'Variants',
                $this->ProductVariants(),
                GridFieldConfig_RecordEditor::create()
            )
        );
        return $fields;
    }
}
