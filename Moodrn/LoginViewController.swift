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
import ParseFacebookUtilsV4

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    @IBAction func didTapLogin(sender: AnyObject) {
    
        var permissions = ["public_profile", "email"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                    
                } else {
                    print("User logged in through Facebook!")
                    
                    //trying just using segues
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                    
                    //let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("MessageViewController") as! MessageViewController
                    
                    //let protectedPageNav = UINavigationController(rootViewController: protectedPage)
                    
                    //appDelegate.window?.rootViewController = protectedPageNav
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        }
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}