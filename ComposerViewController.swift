//
//  ComposerViewController.swift
//  Moodrn
//
//  Created by David Scoville on 12/6/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse

class ComposerViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendButtons: UIButton!
    @IBOutlet weak var keyboardScrollView: UIScrollView!
    @IBOutlet weak var keyboardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.textField.becomeFirstResponder()
        
        
       // self.textField.keyboardType = UIKeyboardTypeASCIICapable;
        
        //        let string = "😀"
        //        let character = Array(arrayLiteral: string)[0]
        //        if string.isIncludingEmoji {
        //
        //        }
        // Do any additional setup after loading the view.
    }
    

    
//    override func viewWillAppear() {
//        super.viewWillappear()
//        self.textField.becomeFirstResponder()
//    }
    
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

}
