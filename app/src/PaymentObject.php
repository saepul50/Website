<?php
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;

class PaymentObject extends DataObject{
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
        'Name' => 'Text',
        'CustomerNumber' => 'Varchar',
        'Address' => 'Text',
        'AddressDetail' => 'Text',
        'OrderID' => 'Varchar(255)',
        'Bank' => 'Text',
        'BankRek' => 'Int'
    ];
    private static $has_one = [
        'Member' => Member::class,
        'BankImg'=> Image::class,
    ];
}