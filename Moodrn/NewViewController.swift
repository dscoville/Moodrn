//
//  NewViewController.swift
//  Pods
//
//  Created by Valerie Chao on 12/3/15.
//
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleString: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.titleString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
