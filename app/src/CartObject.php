<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;

    class CartObject extends DataObject {
        private static $db = [
            'ProductID' => 'Int',
            'ProductTitle' => 'Text',
            'ProductImage' => 'Varchar(255)',
            'VariantName' => 'Text',
            'Price' => 'Decimal(19, 2)',
            'Quantity' => 'Int',
            'VariantID' => 'Int'
        ];
        private static $has_one = [
            'Member' => Member::class
        ];
        public function getFormattedPrice() {
            if ($this->Price) {
                return 'Rp. ' . number_format($this->Price, 0, '', '.');
            }
            return 'Rp. 0';
        }
    }