//
//  MessageViewController.swift
//  Moodrn
//
//  Created by Nathan Garvie on 11/22/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
