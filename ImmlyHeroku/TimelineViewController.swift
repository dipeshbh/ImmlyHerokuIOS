//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Bhattacharya, Dipesh on 8/7/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit
import TwitterKit


class TimelineViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in

            if let validSession = session {
                
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "%23I140EAD%20OR%20%23immigrationreform", APIClient: client)

                
                
            } else {
                
                println("error: \(error!.localizedDescription)")
                
            }
        }
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
