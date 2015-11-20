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
//import GradientView

class LoginViewController: UIViewController {

    @IBOutlet weak var gradientView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize a gradient view
        // let gradientView = GradientView(frame: CGRectMake(20, 20, 280, 280))
        
        // Set the gradient colors
        gradientView.colors  = [UIColor.greenColor(), UIColor.yellowColor()]
        
        // Optionally set some locations
        gradientView.locations = [0.8, 1.0]
        
        // Optionally change the direction. The default is vertical.
        gradientView.direction = .Horizontal
        //gradientView.type = .Radial
        
        // Add some borders too if you want
        gradientView.topBorderColor = UIColor.redColor()
        gradientView.bottomBorderColor = UIColor.blueColor()
        
        // Add it as a subview in all of its awesome
        view.addSubview(gradientView)
        
        }
    
    @IBAction func didTapLogin(sender: AnyObject) {
    
        var permissions = ["public_profile", "email"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
