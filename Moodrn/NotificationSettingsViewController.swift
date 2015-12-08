//
//  NotificationSettingsViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 12/7/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit

class NotificationSettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var objects = [
        ["title" : "Daily", "subtitle" : "Get notified once a day"],
        ["title" : "Weekly", "subtitle" : "Get notified once a week"],
        ["title" : "Monthly", "subtitle" : "Get notified once a month"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
