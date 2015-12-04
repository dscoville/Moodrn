//
//  SettingsViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 12/3/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didPressX(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}



//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showView", sender: self)
//    }
