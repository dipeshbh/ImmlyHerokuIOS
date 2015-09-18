//
//  ForumViewController.swift
//  ImmlyHeroku
//
//  Created by Bhattacharya, Dipesh on 9/12/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit

class ForumViewController: UIViewController {

    @IBOutlet weak var forumView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let url = NSURL(string: "https://nodebbdb.herokuapp.com/")
        let request = NSURLRequest(URL: url!) as NSURLRequest!
        self.forumView.loadRequest(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
