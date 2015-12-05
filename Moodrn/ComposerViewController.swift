//
//  ComposerViewController.swift
//  Moodrn
//
//  Created by David Scoville on 12/3/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse
//import NSString+RemoveEmoji

class ComposerViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let string = "😀"
//        let character = Array(arrayLiteral: string)[0]
//        if string.isIncludingEmoji {
//            
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSendButton(sender: AnyObject) {
        let message = PFObject(className: "Message")
        
        message["text"] = textField.text
        
        let userEmail = PFUser.currentUser()?.email
        message["username"] = userEmail
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("successful")
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
