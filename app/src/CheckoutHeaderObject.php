<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Dev\Debug;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBHTMLText;

    class CheckoutHeaderObject extends DataObject{
        private static $db = [
            'OrderID'=>'Varchar(255)',
            'Name'=> 'Text',
            'Number'=> 'Varchar',
            'Address'=> 'Text',
            'AddressDetail' => 'Text',
            'FinalPrice'=> 'Int',
            'Bank' => 'Text',
            'Message'=> 'Text',
            'Status' => 'Enum("Pending,Processing,Completed,Cancelled", "Pending")',
            'TimeCheckout'=> 'Text',
            'PaymentMethod' => 'Text'
        ];
        private static $has_many = [
            'Items'=> CheckoutObject::class,
        ];
        private static $has_one = [
            'ProofImage' => Image::class
        ];
        private static $summary_fields = [
            'OrderID'=>'No. Resi',
            'Name'=> 'Nama Customer',
            'TimeCheckout' => 'Waktu Pemesanan',
            'StatusBadge' => 'Status',
            'PaymentMethod' => 'Pembayaran'
        ];
        private static $default_sort = 'Created DESC';
        // public function getOrderIDLink() {
        //     if ($this->PaymentMethod === 'Duitku Transfer') {
        //         $link = '<a href="localhost:85/duitkupayment/checkTransaction?orderid=' . $this->OrderID . '" target="_blank">' . $this->OrderID . '</a>';
        //         return $link;
        //     }
        //     return $this->OrderID;
        // }
        protected function onAfterWrite() {
            parent::onAfterWrite();
            
            if ($this->isChanged('Status')) {
                $this->handleStatusChange();
            }
        }
        
        protected function handleStatusChange() {
            if ($this->Status == 'Completed') {
                foreach ($this->Items() as $item) {
                    if ($item) {
                        // Debug::show($item);
                        // die();
                        $item->updateStock();
                        $item->updateSold();
                    }
                }
            }
        }        
        public function getCMSFields() {
            $fields = parent::getCMSFields();
            
            foreach ($fields->dataFields() as $field) {
                if (!$field instanceof DropdownField && !$field instanceof UploadField) {
                    $field->setReadonly(true);
                }
            }

            if ($statusField = $fields->fieldByName('Root.Main.Status')) {
                $statusField->setReadonly(false);
            }
    
            if ($proofImageField = $fields->fieldByName('Root.Main.ProofImage')) {
                $proofImageField->setReadonly(false);
            }
            if ($this->PaymentMethod === 'Duitku Transfer') {
                $link = '<a href="duitkupayment/checkTransaction?orderid=' . $this->OrderID . '" target="_blank">Cek Status Duitku</a>';
                $fields->replaceField('OrderID', LiteralField::create('OrderID', $link));
            }
            return $fields;
        }
        public function getStatusBadge() {
            $color = '';
            switch ($this->Status) {
                case 'Pending':
                    $color = 'darkorange';
                    break;
                case 'Processing':
                    $color = 'darkblue';
                    break;
                case 'Cancelled':
                    $color = 'red';
                    break;
                case 'Completed':
                    $color = 'green';
                    break;
            }
    
            return DBHTMLText::create()->setValue(sprintf(
                '<span style="display: flex; align-items: center; justify-content: center; width: 100px; background-color: %s; color: white; padding: .5rem 1rem; border-radius: 4px;">%s</span>',
                $color,
                $this->Status
            ));
        }
        public function getFormattedFinalPrice() {
            // Debug::show($this->FinalPrice);
            // die();
            if ($this->FinalPrice) {
                return 'Rp. ' . number_format($this->FinalPrice, 0, '', '.');
            }
            return 'Rp. 0';
        }
    }