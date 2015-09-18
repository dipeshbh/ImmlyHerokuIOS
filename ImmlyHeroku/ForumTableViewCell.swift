//
//  ForumTableViewCell.swift
//  ImmlyHeroku
//
//  Created by Bhattacharya, Dipesh on 9/12/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit

class ForumTableViewCell: UITableViewCell {

    @IBOutlet weak var gcType: UILabel!
    
    @IBOutlet weak var cnCutOff: UILabel!
    @IBOutlet weak var inCutOff: UILabel!
    
    
    @IBOutlet weak var mxCutOff: UILabel!
    
    @IBOutlet weak var rowCutOff: UILabel!
    
    @IBOutlet weak var bulletinDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
