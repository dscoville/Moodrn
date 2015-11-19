//
//  LoginViewController.swift
//  Moodrn
//
//  Created by Nathan Garvie on 11/18/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            print("Not Logged In")
        } else {
            print("Logged in")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
        email = ""
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("login complete")
            //get access token
            let accessToken = FBSDKAccessToken.currentAccessToken()
            if(accessToken != nil) //should be != nil
            {
                print("accessToken String: ")
                print(accessToken.tokenString)
            }
            
            //let user = PFUser()
            
           // email = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET") as! String
            
           // user.username = email
            
                     
            //request email from FB
            let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
                req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
                    if(error == nil)
                    {
                        print("result \(result)")
                    }
                    else
                    {
                        print("error \(error)")
                    }
                })

           // user.signUpInBackgroundWithBlock({ (status: Bool, error: NSError?) -> Void in
           //     if error == nil {
          //          self.performSegueWithIdentifier("showNew", sender: self)
          //      }
          ///      else{
           //         print("parse errro")
          //     }
         //   })
            
            
            
            
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }


}
