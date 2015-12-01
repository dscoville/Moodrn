//
//  MoodTableViewCell.swift
//  Moodrn
//
//  Created by Valerie Chao on 11/18/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!

    
    @IBOutlet weak var emojiLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
