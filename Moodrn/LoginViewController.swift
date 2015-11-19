//
//  LoginViewController.swift
//  Moodrn
//
//  Created by Nathan Garvie on 11/19/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import ParseFacebookUtilsV4
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
    
    func loginWithFB() {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile","email"]) {
        (user: PFUser?, error: NSError?) -> Void in
        if let user = user {
            if user.isNew {
                print("User signed up and logged in through Facebook!")
            } else {
                print("User logged in through Facebook!")
            }
        } else {
            print("Uh oh. The user cancelled the Facebook login.")
        }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
