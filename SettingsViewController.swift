//
//  SettingsViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 12/3/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var titles: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titles = ["About", "Log Out"]

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
        
        return cell
    }
    
    

}






//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showView", sender: self)
//    }
