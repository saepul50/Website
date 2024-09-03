<?php
use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;
use SilverStripe\Assets\Image;
use SilverStripe\Dev\Debug;

 class CheckoutObject extends DataObject{
    private static $db = [
        'ProductID' => 'Int',
        'CartID' => 'Int',
        'ProductTitle' => 'Text',
        'ProductImage' => 'Varchar(255)',
        'VariantName'=> 'Text',
        'VariantID' => 'Int',
        'Price' => 'Text',
        'TotalPrice' => 'Text',
        'Quantity' => 'Int',
        'FinalPrice' => 'Text',
    ];
    private static $has_one = [
        'Member' => Member::class,
        'HeaderCheckout' => CheckoutHeaderObject::class,
        'ProductVariant' => ProductVariantObject::class
    ];
    private static $summary_fields = [
        'ProductTitle' => 'Product Name'
    ];
    public function getCMSFields() {
        $fields = parent::getCMSFields();
        
        foreach ($fields->dataFields() as $field) {
            $field->setReadonly(true);
        }

        return $fields;
    }
    public function getOrderStatus(){
        if ($this->HeaderCheckout()->exists()) {
            return $this->HeaderCheckout()->Status;
        }
        return null;
    }
    public function updateStock() {
        $variant = ProductVariantObject::get()->byID($this->VariantID);
        if ($variant) {
            // Debug::show($variant->Stock);
            // die();
            if ($variant->Stock >= $this->Quantity) {
                $variant->Stock -= $this->Quantity;
            } else {
            }
        
            $variant->write();
        }
    }
    public function updateSold() {
        $product = ProductObject::get()->byID($this->ProductID);
        if ($product) {
            // Debug::show($variant->Stock);
            // die();
            $product->QuantitySold += $this->Quantity;
        
            $product->write();
        }
    }
    
    // public function onBeforeWrite() {
    //     parent::onBeforeWrite();

    //     if ($this->Price) {
    //         $this->Price = str_replace(['Rp. ', '.'], '', $this->Price);
    //     }
    //     if ($this->TotalPrice) {
    //         $this->TotalPrice = str_replace(['Rp. ', '.'], '', $this->TotalPrice);
    //     }
    //     if ($this->FinalPrice) {
    //         $this->FinalPrice = str_replace(['Rp. ', '.'], '', $this->FinalPrice);
    //     }
    // }
    // public function getFormattedPrice() {
    //     if ($this->Price) {
    //         return 'Rp. ' . number_format($this->Price, 0  , '', '.');
    //     }
    //     return 'Rp. 0';
    // }
    public function getFormattedFinalPrice() {
        if ($this->FinalPrice) {
            return 'Rp. ' . number_format($this->FinalPrice, 0  , '', '.');
        }
        return 'Rp. 0';
    }
 }