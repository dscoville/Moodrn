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

    
    @IBOutlet weak var tableView: UITableView!

    
    var objects = [
        ["title" : "Notifications", "subtitle" : "Choose when you get notifications"],
        ["title" : "About", "subtitle" : "Learn more about Moodrn"],
        ["title" : "Log Out", "subtitle" : "Log out of Moodrn"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userEmail = PFUser.currentUser()?.email
//        nameLabel.text = "\(userEmail)"
//        print("\(userEmail)")
        


        tableView.delegate = self
        tableView.dataSource = self
        
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        

    
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
    }
    
    
    
    @IBAction func didPressX(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // how many rows?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    // create the cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.tableView.separatorColor = UIColor(red: 1, green:1, blue:1, alpha: 0.3)
        
        var cell = tableView.dequeueReusableCellWithIdentifier("SettingsCell") as! SettingsCell
        
        
        let object = objects[indexPath.row]
        
        cell.titleLabel?.text = object["title"]!
        cell.subtitleLabel?.text = object["subtitle"]!
        
        
        if cell.titleLabel.text == "Log Out" {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.3608, green: 0.0314, blue: 0.9059, alpha: 1.0) /* #5c08e7 */
        cell.selectedBackgroundView = backgroundView
        

        
        
        return cell
    }
    
    
    


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row

        if row == 0 {
            print("Notifications")
            self.performSegueWithIdentifier("testSegue", sender: self)
        } else if row == 1 {
            print("About")
            self.performSegueWithIdentifier("aboutSegue", sender: self)
        } else if row == 2 {
            print("Log out")
        } else {
            print ("Not working")
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    

}






//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showView", sender: self)
//    }
