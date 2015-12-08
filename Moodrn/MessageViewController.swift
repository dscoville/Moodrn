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
    
    func setupNotifications(){
        // crete reply notifications action
        let replyAction = UIMutableUserNotificationAction()
        replyAction.identifier = "REPLY_ACTION"
        replyAction.destructive = false
        replyAction.title = "Reply"
        replyAction.activationMode = .Foreground
        replyAction.authenticationRequired = true
        // make the notification have a text box
        replyAction.behavior = .TextInput
        
        // define notification categories
        let category = UIMutableUserNotificationCategory()
        category.identifier = "HOWAREYOUFEELING"
        category.setActions([replyAction], forContext: .Default)
        category.setActions([replyAction], forContext: .Minimal)
        
        let categories = NSSet(object: category) as! Set<UIUserNotificationCategory>
        
        // request notification permissions
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: categories)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }
    
    func unsubscribeAllNotificationChannels(){
        let currentInstallation = PFInstallation.currentInstallation()
        // remove any other channels subscribed to
        currentInstallation.channels = []
        currentInstallation.saveInBackground()
    }
    
    @IBAction func didTapSignOutButton(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func didTapMorningButton(sender: AnyObject) {
        self.setupNotifications()
        self.unsubscribeAllNotificationChannels()
        
        // When users indicate they want morning notifications, we subscribe them to that channel.
        let currentInstallation = PFInstallation.currentInstallation()
        let subscribedChannels = PFInstallation.currentInstallation().channels
        
        //suscribe to notification channel
        currentInstallation.addUniqueObject("Morning", forKey: "channels")
        currentInstallation.saveInBackground()
        
        print("Successfully subscribed to \(subscribedChannels)")
        
        performSegueWithIdentifier("timelineSegue", sender: nil)
        
    }
    
    @IBAction func didTapAfternoonButton(sender: AnyObject) {
        self.setupNotifications()
        self.unsubscribeAllNotificationChannels()
        
        // When users indicate they want afternoon notifications, we subscribe them to that channel.
        let currentInstallation = PFInstallation.currentInstallation()

        currentInstallation.addUniqueObject("Afternoon", forKey: "channels")
        currentInstallation.saveInBackground()
        print("Successfully subscribed to \(currentInstallation.channels)")
        
        performSegueWithIdentifier("timelineSegue", sender: nil)
    }
    
    @IBAction func didTapEveningButton(sender: AnyObject) {
        self.setupNotifications()
        self.unsubscribeAllNotificationChannels()
        
        // When users indicate they want Evening notifications, we subscribe them to that channel.
        let currentInstallation = PFInstallation.currentInstallation()
        
        currentInstallation.addUniqueObject("Evening", forKey: "channels")
        currentInstallation.saveInBackground()
        
        print("Successfully subscribed to \(currentInstallation.channels)")
        
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
