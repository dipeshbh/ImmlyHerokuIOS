//
//  TwitterNavigationItem.swift
//  ImmlyHeroku
//
//  Created by Bhattacharya, Dipesh on 9/20/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterNavigationItem: UINavigationItem {
    
    
    var tweeButton = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.Plain, target: TimelineViewController(), action: Selector("composeTweet"))
    
    
   
}
