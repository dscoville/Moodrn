//
//  TimelineViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 11/18/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import Parse
import HPLTagCloudGenerator

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cloudView: UIView!
    
    
    
//    // I want a whole bunch of strings
//    var dates: [String]!
//    var emojis: [String]!
//    var periods: [String]!
    
    // Using API
    var dates: [NSDate]!
    var emojis: [PFObject]!
    var periods: [String]!
    var photos: [PFObject]!
    
    
    @IBOutlet weak var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reload messages every 2 seconds
        // var reloadTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector:  "reloadMessages()", userInfo: nil, repeats: false)
        
        //initialize variable you're using api with, as an empty array
        emojis = []
        dates = []
        photos = []
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        let query = PFQuery(className: "User")
        
        let photo = PFUser.currentUser()?.email
        
        query.whereKey("profile_picture", equalTo: photo!)
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            self.photos = objects
            self.tableView.reloadData()
            print(self.photos)
            
        }
        
        // set Settings button to FB profile picture
        settingsButton.setImage(UIImage(named: "settings.png")!, forState: .Normal)
        
        
        
//        func reloadMessages() {
//            print("reloading")
//            let query = PFQuery(className: "Message")
//            query.orderByAscending("createdAt")
//            // query.limit = 25
//            
//            let userEmail = PFUser.currentUser()?.email
//            ///////THIS IS WHERE WE NEED THE USERNAME
//            query.whereKey("username", equalTo: userEmail!)
//            query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
//                
//                
//                self.emojis = objects
//                
//                //print(self.messages)
//                self.tableView.reloadData()
//            }
//            
//        }

        
        // use an API and remember to add the security thing to the info.plist file
//        let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us")!
//        let request = NSURLRequest(URL: url)
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//
//            let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
//            
//            //For everything you pull out of a filing cabinet / dictionary, need to use the as! statement to tell it the type
//            self.dates = dictionary["movies"] as! [NSDictionary]
//            self.emojis = dictionary["movies"] as! [NSDictionary]

            
//            self.tableView.reloadData()
//            
//            //print(dictionary)
//        }
        
        
//        // arrays
//        dates = ["Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"]
//        print(dates[0])

//        emojis = ["☺️👍🏼💕💤", "🍲💁🏻💅🎵🌟🎉🍹🌆", "💩😢💔", "👌🏼🌸🍃🍀", "😴😴😴", "☔️", "🍎🏃🏻🚲"]
//        print(emojis[0])
        
        

        periods = ["This Week", "Last Week", "Nov 1-7", "Oct 25-31"]
        print(periods[0])
        
        // Tag Cloud Generator Cocoapod
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
//            var tagDict = ["👍🏼": 3,
//                           "🍲": 5,
//                           "🍹": 7,
//                           "🍎": 9,
//                           "🎵": 11,
//                           "🚲": 13,
//                           "☺️": 15,
//                           "💕": 17,
//                           "🌟": 19,
//                           "👌🏼": 21,
//                           "☔️": 23,
//                           "😴": 25,
//                           "🎉": 25,
//                           "💤": 25,
//                           "🏃🏻": 25,
//                           "😁": 27,
//                           "😐": 27,
//                           "😎": 27,
//                           "🌺": 27,
//                           "💩": 100]
            
            var tagDict = [String: Int]()
            
            let query = PFQuery(className: "Message")
            query.orderByAscending("createdAt")
            // query.limit = 25
            
            let userEmail = PFUser.currentUser()?.email
            query.whereKey("username", equalTo: userEmail!)
            query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                
                
                self.emojis = objects
                
                for (index, element) in self.emojis.enumerate() {
                    //print("Item \(index): \(element)")
                    let text = element["text"] as? String
                    if text != nil {
                        for character in text!.characters {
                            //print(character)
                            let count = tagDict["\(character)"]
                            if count != nil {
                                tagDict["\(character)"] = count! + 1
                            } else {
                                tagDict["\(character)"] = 1
                            }
                        }
                    }
                }
                
                var tagGenerator = HPLTagCloudGenerator()
                tagGenerator.size = self.cloudView.frame.size
                tagGenerator.tagDict = tagDict
                
                var views = tagGenerator.generateTagViews() as! [UILabel]
                
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    for tagView in views {
                        self.cloudView.addSubview(tagView)
                        tagView.textColor = UIColor.blueColor()
                        //                    tagView.text =
                    }
                })
                
                
                
                self.reloadMessages()
                
            }
        }
        
        
        
        
        
//        dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            // This runs in a background thread
//            
//            // dictionary of tags
//            NSDictionary *tagDict = @{@"tag1": @3,
//                @"tag2": @5,
//                @"tag3": @7,
//                @"tag4": @2};
//            
//            
//            HPLTagCloudGenerator *tagGenerator = [[HPLTagCloudGenerator alloc] init];
//            tagGenerator.size = CGSizeMake(self.tagView.frame.size.width, self.tagView.frame.size.height);
//            tagGenerator.tagDict = tagDict;
//            
//            NSArray *views = [tagGenerator generateTagViews];
//            
//            dispatch_async( dispatch_get_main_queue(), ^{
//            // This runs in the UI Thread
//            
//            for(UIView *v in views) {
//            // Add tags to the view we created it for
//            [self.tagView addSubview:v];
//            }
//            
//            });
//            });
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.reloadMessages()

    }

    override func viewWillAppear(animated: Bool) {
        self.reloadMessages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadMessages() {
        print("reloading")
        let query = PFQuery(className: "Message")
        query.orderByDescending("createdAt")
        // query.limit = 25
    
        let userEmail = PFUser.currentUser()?.email
        ///////THIS IS WHERE WE NEED THE USERNAME
        query.whereKey("username", equalTo: userEmail!)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
        
        
            self.emojis = objects
        
            //print(self.messages)
            self.tableView.reloadData()
        }
        
    }


   // Tell table view how many rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
        //write if statements to sort data in the sections appropriately if section is 9 , return 9 etc when I have parse data
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // create a copy of a type of cell. The ! means if I fail to cast it it will fail, if you use ? it will turn it to nil if it doesnt work but in this case you want to use !
        var cell = tableView.dequeueReusableCellWithIdentifier("MoodTableViewCell") as! MoodTableViewCell
        
        
        let emoji = emojis[indexPath.row]
        
        //Set the date to be the created field from Parse Class
        let date = emoji.createdAt
        
        //Reformat the date to be a string
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM-d"
        let formatteddate = formatter.stringFromDate(date!)
        cell.dateLabel.text = formatteddate
        
        cell.emojiLabel.text = emoji["text"] as? String
        cell.emojiLabel.sizeToFit()
        
        
        
        //print(cell.dateLabel.text)
        return cell
        
        //index path is which one we're on now
//        var date = dates[indexPath.row]
//        let emoji = emojis[indexPath.row]
//        
//        
//        cell.dateLabel.text = date["synopsis"] as? String
//        
//        cell.emojiLabel.text = emoji["title"] as? String
//        
//        return cell
    }
    

    
    // MAKING TABLE VIEW SECTIONS...table view has a header and a footer, you can just drag a view above or below the cell. it also has sections and section headers with cells inside.
    
    // don't use this one because you cant customize it as much
    //    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "This Week"
    //    }
    
    // specify how many sections you want
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    // Create section headers; find colors at http://uicolor.io/#/hex-to-ui
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 24))
        
        sectionView.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        
        let label = UILabel(frame: CGRect(x: 16, y: 3, width: sectionView.frame.size.width - 32, height: 18))
        
        var period = periods[section]
        label.text = period
        label.font = UIFont.boldSystemFontOfSize(12)
        
        let dividerView = UIView(frame: CGRect(x: 0, y: 24, width: tableView.frame.size.width, height: 0.5))
        
//        dividerView.backgroundColor = UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.0)

        
        sectionView.addSubview(label)
        sectionView.addSubview(dividerView)
        
        label.textColor = UIColor(red:0.31, green:0.34, blue:0.40, alpha:1.0)
        
        return sectionView
    }
    
    // for some reason you need to add this thing to make sure it sets the height, in addition to setting the height above. height needs to match in both places
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    
}
