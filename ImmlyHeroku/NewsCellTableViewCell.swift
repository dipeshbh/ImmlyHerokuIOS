//
//  TopicsCellTableViewCell.swift
//  NewsFeed
//
//  Created by Bhattacharya, Dipesh on 7/21/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit
import Parse

class NewsCellTableViewCell: UITableViewCell {

  
    @IBOutlet weak var companyLogo: UIImageView!

    @IBOutlet weak var viewComments: UIButton!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var descr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
