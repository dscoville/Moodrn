//
//  MessageViewController.swift
//  Moodrn
//
//  Created by Nathan Garvie on 11/22/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import ParseFacebookUtilsV4

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestParameters = ["fields": "id, email, first_name, last_name"]
        let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParameters)
        
        userDetails.startWithCompletionHandler { (connection, result,
            error: NSError!) -> Void in
            if error != nil {
                print("\(error.localizedDescription)")
            }
            if result != nil {
                let userID:String = result["id"] as! String
                let userFirstName:String? = result["first_name"] as! String
                let userLastName:String? = result["last_name"] as! String
                let userEmail:String? = result["email"] as! String
            
                let myUser:PFUser = PFUser.currentUser()!
                
                //Save First name
                if(userDetails != nil){
                    myUser.setObject(userFirstName!, forKey: "first_name")
                }
                //Save Last name
                if(userDetails != nil){
                    myUser.setObject(userLastName!, forKey: "last_name")
                }
                //Save Email address
                if(userDetails != nil){
                    myUser.setObject(userEmail!, forKey: "email")
                }
                
                
                //wrapping the profile picture grab into an async task so that the app doesn't wait for the profile pic to download before moving on. I don't understand this code
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                
                    //Get profile picture—let's creep some faces
                    var userProfile = "https://graph.facebook.com/" + userID + "/picture?type=large"
                    
                    let profilePicutreURL =  NSURL(string: userProfile)
                    let profilePicutreData = NSData(contentsOfURL: profilePicutreURL!)
                    
                    if (profilePicutreData != nil) {
                        
                        //convert the data of the picture grabbed into a parse file object
                        let profileFileObject = PFFile(data: profilePicutreData!)
                        
                        //assign the parse file object to the current user
                        myUser.setObject(profileFileObject!, forKey: "profile_picture")
                    }
                    
                    myUser.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            print("user info was saved to parse")
                        }
                        
                    })
                }
            }
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOutButton(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func didTapMorningButton(sender: AnyObject) {
        // When users indicate they want morning notifications, we subscribe them to that channel.
        let currentInstallation = PFInstallation.currentInstallation()
        currentInstallation.addUniqueObject("Morning", forKey: "channels")
        currentInstallation["channles"] = PFUser.currentUser()
        currentInstallation.saveInBackground()
        print("Successfully subscribed to \(currentInstallation.channels)")
        
        let channels = [ "Morning" ];
        let push = PFPush()
        let data = [
            "alert" : "The Mets scored! The game is now tied 1-1!",
            "badge" : "Increment"
        ]
        
        // Be sure to use the plural 'setChannels'.
        push.setChannels(channels)
        push.setData(data)
        push.sendPushInBackground()
        
        performSegueWithIdentifier("timelineSegue", sender: nil)
        
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
