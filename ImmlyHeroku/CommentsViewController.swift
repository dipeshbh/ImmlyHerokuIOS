//
//  CommentsViewController.swift
//  ImmlyHeroku
//
//  Created by Bhattacharya, Dipesh on 9/28/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var viewComments: UIWebView!
    
    var request:NSMutableURLRequest = NSMutableURLRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewComments.loadRequest(request)


        // Do any additional setup after loading the view.
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
