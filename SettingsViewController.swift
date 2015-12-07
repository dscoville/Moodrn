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
    
    var titles: [String]!
    var subtitles: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userEmail = PFUser.currentUser()?.email
//        nameLabel.text = "\(userEmail)"
//        print("\(userEmail)")
        
        titles = ["Notifications", "Log Out"]
        subtitles = ["Choose when you get notifications, Logged in as \(userEmail)"]

        tableView.delegate = self
        tableView.dataSource = self
        


        
        
        
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

//        
//        var subtitle = subtitles[indexPath.row]
//        cell.subtitleLabel.text = subtitle
        
        return cell
    }
    
    

}






//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showView", sender: self)
//    }
