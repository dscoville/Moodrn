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
    
    
    @IBOutlet weak var emojiView: UIView!
    @IBOutlet weak var farEmojiView: UIView!
    @IBOutlet weak var midEmojiView: UIView!
    @IBOutlet weak var closeEmojiView: UIView!
    
    
    var farEmojiOriginalCenter: CGPoint!
    var midEmojiOriginalCenter: CGPoint!
    var closeEmojiOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        farEmojiOriginalCenter = farEmojiView.center
        midEmojiOriginalCenter = midEmojiView.center
        closeEmojiOriginalCenter = closeEmojiView.center


        //emojiWallpaperOriginalCenter = emojiView.center
        self.animateEmojiWallpaper()
    
    }
    
    func animateEmojiWallpaper() {
        //animate smallest emojis slower than others
        UIView.animateWithDuration(20.0, delay: 0.2, options: [.Repeat, .CurveLinear], animations: {
            self.farEmojiView.center = CGPoint(x: self.farEmojiOriginalCenter.x, y: self.farEmojiOriginalCenter.y - 664)
            }, completion: nil)
        
        UIView.animateWithDuration(16.0, delay: 0.2, options: [.Repeat, .CurveLinear], animations: {
            self.midEmojiView.center = CGPoint(x: self.midEmojiOriginalCenter.x, y: self.midEmojiOriginalCenter.y - 664)
            }, completion: nil)
        
        UIView.animateWithDuration(12.0, delay: 0.2, options: [.Repeat, .CurveLinear], animations: {
            self.closeEmojiView.center = CGPoint(x: self.closeEmojiOriginalCenter.x, y: self.closeEmojiOriginalCenter.y - 664)
            }, completion: nil)
        
        
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
                    self.animateEmojiWallpaper()
                    //trying just using segues
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                    
                    //let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("MessageViewController") as! MessageViewController
                    
                    //let protectedPageNav = UINavigationController(rootViewController: protectedPage)
                    
                    //appDelegate.window?.rootViewController = protectedPageNav
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
                self.animateEmojiWallpaper()
            }
        }
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
