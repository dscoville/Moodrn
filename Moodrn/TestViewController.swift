//
//  TestViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 12/7/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var objects = [
        ["title" : "Morning", "subtitle" : "Choose when you get notifications"],
        ["title" : "Afternoon", "subtitle" : "Learn more about Moodrn"],
        ["title" : "Evening", "subtitle" : "Logged in as Valerie"]]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("TestCell") as! TestCell
        
        let object = objects[indexPath.row]
        
        cell.testLabel?.text = object["title"]
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.3608, green: 0.0314, blue: 0.9059, alpha: 1.0) /* #5c08e7 */
        cell.selectedBackgroundView = backgroundView
        
 
        
        return cell
    }

    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        
//        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        if row == 0 {
            print("Morning")
        } else if row == 1 {
            print("Afternoon")
        } else if row == 2 {
            print("Evening")
        } else {
            print ("Not working")
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
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
