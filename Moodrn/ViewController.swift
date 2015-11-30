//
//  ViewController.swift
//  Moodrn
//
//  Created by David Scoville on 11/16/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var messages: [PFObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        messages = []
        
        reloadMessages()
        reloadMessages()
        
//        if (FBSDKAccessToken.currentAccessToken() == nil) {
//            print("Not Logged In")
//        } else {
//            print("Logged in")
//        }
        
//        var loginButton = FBSDKLoginButton()
//        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
//        loginButton.center = self.view.center
//        
//        loginButton.delegate = self
//        
//        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
//        if error == nil {
//            print("login complete")
//            self.performSegueWithIdentifier("showNew", sender: self)
//        } else {
//            print(error.localizedDescription)
//        }
//    }
//    
//    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
//        print("user logged out")
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") as! MessageCell
        
        let message = messages[indexPath.row]
        print("hello")
        cell.messageLabel.text = message["text"] as? String
        print(message["text"])
        return cell
    }
    
    
    @IBAction func didPressSendButton(sender: AnyObject) {
        let message = PFObject(className: "Message")
        
        message["text"] = messageField.text
        message["username"] = "bob"
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("successful")
        }
        
    }
    
    func reloadMessages() {
        let query = PFQuery(className: "Message")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            self.messages = objects
            
            //print(self.messages)
            self.tableView.reloadData()
        }
    }


}

