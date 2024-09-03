<?php

use SilverStripe\Control\HTTPRequest;
use SilverStripe\Control\HTTPResponse;
use SilverStripe\Admin\ModelAdmin;
use SilverStripe\ORM\DataObject;

class PromotionAdmin extends ModelAdmin {
    private static $menu_title = 'Promotion';
    private static $url_segment = 'promotion';
    private static $menu_icon_class = 'font-icon-tags';
    private static $managed_models = [
        PromotionObject::class
    ];
}
