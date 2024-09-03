<?php

use SilverStripe\Control\HTTPRequest;
use SilverStripe\Control\Session;
use SilverStripe\Dev\Debug;
use SilverStripe\Security\MemberAuthenticator\LoginHandler;
use SilverStripe\Security\MemberAuthenticator\MemberAuthenticator;

class LogPageController extends PageController {
    private static $allowed_actions = [
        'processlogin'
    ];
    public function processlogin(HTTPRequest $request) {
        $email = $request->postVar('Email');
        $password = $request->postVar('Password');
        
        $data = [
            'Email' => $email,
            'Password' => $password
        ];

        $MemberAuthenticator = new MemberAuthenticator();
        $loginHandler = new LoginHandler('auth', $MemberAuthenticator);
        
        $member = $loginHandler->checkLogin($data, $request);
        if($member){
            $loginHandler->performLogin($member, $data, $request);
            $session = $request->getSession();
            $session->set('MemberID', $member->ID);
            // Debug::show(''. $member->FirstName);
            return json_encode([
                'success' => true
            ]);
        } else {
            return json_encode([
                'success' => false,
                'message' => 'gaiso'
            ]);
        }
        
    }
}