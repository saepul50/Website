<?php

use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\NumericField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\CheckboxField;

class PromotionObject extends DataObject {
    private static $db = [
        'PromoText1' => 'Text',
        'PromoText2' => 'Text',
        'PromoPrice' => 'Currency',
        'ProductImagesID' => 'Int',
        'ShowPromotion1' => 'Boolean',
        'ShowPromotion2' => 'Boolean',
        'ShowPromotion3' => 'Boolean',
        'ShowPromotion4' => 'Boolean',
        'ShowPromotion5' => 'Boolean',
        'ShowPromotion6' => 'Boolean',
        'ShowPromotion7' => 'Boolean'
    ];

    private static $has_one = [
        'Product' => ProductObject::class,
        'ProductImages' => Image::class
    ];

    public function getCMSFields() {
        $fields = FieldList::create(
            DropdownField::create('ProductID', 'Select Product', ProductObject::get()->map('ID', 'Title'))
                ->setEmptyString('--Select a product--')
                ->setDescription('Choose the product for this promotion')
                ->setValue($this->ProductID),
            TextField::create('PromoText1', 'Text 1'),
            TextField::create('PromoText2', 'Text 2'),
            NumericField::create('PromoPrice', 'Promo Price'),
            CheckboxField::create('ShowPromotion1', 'Show Promotion 1'),
            CheckboxField::create('ShowPromotion2', 'Show Promotion 2'),
            CheckboxField::create('ShowPromotion3', 'Show Promotion 3'),
            CheckboxField::create('ShowPromotion4', 'Show Promotion 4'),
            CheckboxField::create('ShowPromotion5', 'Show Promotion 5'),
            CheckboxField::create('ShowPromotion6', 'Show Promotion 6'),
            CheckboxField::create('ShowPromotion7', 'Show Promotion 7')
        );
    
        if ($this->ProductID) {
            $product = ProductObject::get_by_id($this->ProductID);
            if ($product && $product->ProductImages()->exists()) {
                $image = $product->ProductImages()->first();
                if ($image) {
                    $imageUrl = $image->Link();
                    $fields->add(LiteralField::create(
                        'ProductImages',
                        sprintf(
                            '<div class="product-image-container"><img src="%s" style="width: 40%%; height: auto;" /></div>',
                            $imageUrl
                        )
                    ));
                }
            }
        }
    
        return $fields;
    }
    public function onBeforeWrite() {
        parent::onBeforeWrite();
        
        if ($this->ProductID) {
            $product = ProductObject::get_by_id($this->ProductID);
            if ($product && $product->ProductImages()->exists()) {
                $this->ProductImagesID = $product->ProductImages()->first()->ID;
            }
        }
    }
    public function getFormattedPrice() {
        if ($this->PromoPrice) {
            return 'Rp. ' . number_format($this->PromoPrice, 0, '', '.');
        }
        return 'Rp. 0';
    }
}
