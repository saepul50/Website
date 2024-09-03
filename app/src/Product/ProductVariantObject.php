<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Dev\Debug;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;

class ProductVariantObject extends DataObject {
    private static $db = [
        'VariantName' => 'Text',
        'Price'=> 'Decimal(19, 2)',
        'Stock' => 'Int',
    ];

    private static $has_one = [
        'VariantImage' => Image::class,
        'Product' => ProductObject::class
    ];

    private static $summary_fields = [
        'VariantName' => 'Variant Name',
        'Price' => 'Price',
        'VariantImage.CMSThumbnail' => 'Variant Image',
        'Stock' => 'Stock'
    ];
    
    public function onBeforeWrite() {
        parent::onBeforeWrite();
        if ($this->Price) {
            $this->Price = number_format($this->Price, 2, '.', '');
        }
    }

    public function onAfterWrite() {
        parent::onAfterWrite();
        if ($this->VariantImageID && $this->VariantImage()->exists()) {
            $this->VariantImage()->publishSingle();
        }
    }

    public function getFormattedPrice() {
        if ($this->Price) {
            return 'Rp. ' . number_format($this->Price, 0, '', '.');
        }
        return 'Rp. 0';
    }
    public function getCMSFields() {
        return new FieldList(
            TextField::create('VariantName', 'Variant Name'),
            TextField::create('Price')
            ->setDescription('Input Without "Rp. ".", ","'),
            UploadField::create('VariantImage', 'Variant Image'),
            TextField::create('Stock', 'Stock')
        );
    }
}
