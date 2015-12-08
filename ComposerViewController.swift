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
    @IBOutlet weak var smiley: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///All this stuff does the placement and size of the scroll view and its rectangle child
        keyboardScrollView.contentSize.width = keyboardView.frame.width
        
        keyboardScrollView.contentSize = CGSizeMake(keyboardView.frame.width, keyboardView.frame.height)
        keyboardView.frame.origin.x = 0
        keyboardView.frame.origin.y = 300
        
        let theHeight = view.frame.size.height //grabs the height of your view
        
        keyboardView.frame = CGRect(x: 0, y: theHeight - 320 , width: 5200, height: 320)
        
        self.keyboardScrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPressEmojiKey(sender: AnyObject) {
        self.textField.text = self.textField.text! + sender.titleLabel!!.text!
    }
    @IBAction func didPressDelete(sender: AnyObject) {
        let textFieldText = String(self.textField.text.characters.dropLast())
        
        self.textField.text = textFieldText
    }
    
    @IBAction func didPressSendButton(sender: AnyObject) {
        let message = PFObject(className: "Message")
        
        message["text"] = textField.text
        
        let userEmail = PFUser.currentUser()?.email
        message["username"] = userEmail
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            //self.navigationController?.popViewControllerAnimated(true)
            self.performSegueWithIdentifier("composerToTimelineSegue", sender: self)
            //print("sent")
        }
                //self.performSegueWithIdentifier("backToTimeline", sender: self)
        
    }

}
