//
//  TimelineViewController.swift
//  Moodrn
//
//  Created by Valerie Chao on 11/18/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cloudView: UIView!
    
    // I want a whole bunch of strings
    var dates: [String]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.frame.size.height + cloudView.frame.size.height - 64
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // dates array
        dates = ["Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"]
        print(dates[0])
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   // Tell table view how many rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
//        return 4
        //write if statements to sort data in the sections appropriately if section is 9 , return 9 etc when I have parse data
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // create a copy of a type of cell. The ! means if I fail to cast it it will fail, if you use ? it will turn it to nil if it doesnt work but in this case you want to use !
        var cell = tableView.dequeueReusableCellWithIdentifier("MoodTableViewCell") as! MoodTableViewCell
        
        
        //index path is which one we're on now
        var date = dates[indexPath.row]
        
        cell.dateLabel.text = date
        
        cell.emojiLabel.text = "☺️ 👍🏼 💕"
        
        return cell
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
    
    // http://uicolor.io/#/hex-to-ui
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 24))
        
        sectionView.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        
        let label = UILabel(frame: CGRect(x: 16, y: 3, width: sectionView.frame.size.width - 32, height: 18))

        label.text = "This Week"
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
