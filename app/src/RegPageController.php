<?php
use SilverStripe\Control\Email\Email;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Dev\Debug;
use SilverStripe\ORM\ValidationResult;
use SilverStripe\Security\IdentityStore;
use SilverStripe\Security\Member;
use SilverStripe\Security\MemberAuthenticator\MemberAuthenticator;

class RegPageController extends PageController{
    private static $allowed_actions = [
        'processregister'
    ];
    public function processregister(HTTPRequest $request){
        $firstname = $request->postVar('FirstName');
        $lastname  = $request->postVar('LastName');
        $email      = $request->postVar('Email');
        $password = $request->postVar('Password');

        # Create the member
        $member            = Member::create();
        $member->FirstName = $firstname;
        $member->Surname   = $lastname;
        $member->Email     = $email;
        $member->write();

        return json_encode([
            'success' => true,
            'message' => 'Account Registered'
        ]);
    
        // # Set the password
        // $member->changePassword($password);
    
        
        // $rememberMe = 1;
        // # Let's log this person in
        // $data = [
        //     'Email' => $email,
        //     'Password' => $password,
        //     'Remember' => $rememberMe
        // ];
    
        // $MemberAuthenticator = new MemberAuthenticator;
    
        // $member = $MemberAuthenticator->authenticate($data, $request);
    
        // if ($member !== null)
        // {
        //     # Authenticated ok, log in.
        //     $identityStore = Injector::inst()->get(IdentityStore::class);
        //     $identityStore->logIn($member, $rememberMe);
        //     // $return['success'] = true;
    
        //     // $email = Email::create()
        //     //     ->setHTMLTemplate('Email\\RegisterEmail')
        //     //     ->setData($member)
        //     //     ->setSubject("Welcome to Website")
        //     //     ->addData('firstname', $member->FirstName)
        //     //     ->setTo($member->Email)
        //     //     ->setSender('no-reply@website.co.nz', "Some website");
    
        //     // $email->send();
        //     return json_encode([
        //         'success' => true,
        //         'message' => 'Account Registered'
        //     ]);
        // }
        // return json_encode([
        //     'success' => false
        // ]);
    }
}