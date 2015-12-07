//
//  SettingsViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 12/3/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var photo: [PFObject]!
    
    @IBOutlet weak var tableView: UITableView!
    
    var titles: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titles = ["About", "Log Out"]
        photo = []

        tableView.delegate = self
        tableView.dataSource = self
        
        
//        var user = photo.objectForKey("username") as! PFUser
//        
//        user.fetchIfNeededInBackgroundWithBlock { (obj: PFObject?, error: NSError?) -> Void in
//            if obj != nil {
//                var fetchedUser = obj as! PFUser
//                var username = fetchedUser["username"] as! String
//                cell.username.text = user.username
//                
//                //Profile Picture Retrieve
//                
//                if let userImageFile:PFFile = user["photo"] as? PFFile{
//                    println("working")
//                    userImageFile.getDataInBackgroundWithBlock {
//                        (imageData: NSData?, error: NSError?) -> Void in
//                        if (error == nil) {
//                            if imageData != nil{
//                                cell.profileImage.image = UIImage(data:imageData!)
//                            }else{
//                                println("No Data")
//                            }
//                            
//                        }else{
//                            println(error)
//                        }
//                    }
//                    
//                }else{
//                    
//                    println("Something Error") // Always getting this
//                    
//                }
//                
//                
//                
//            }
//        }
//
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didPressX(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // how many rows?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    // create the cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SettingsCell") as! SettingsCell
        
        var title = titles[indexPath.row]
        
        cell.titleLabel.text = title
        
        return cell
    }
    
    

}






//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showView", sender: self)
//    }
