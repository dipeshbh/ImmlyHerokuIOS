//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Bhattacharya, Dipesh on 8/7/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit
import TwitterKit
import Parse


class TimelineViewController: TWTRTimelineViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("composeTweet"))
        
        //view.backgroundColor = UIColor.whiteColor()
        
        self.tableView.tableFooterView = UIView()

        /*
        /*var strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
        strLabel.text = "Loading"
        strLabel.textColor = UIColor.blackColor()
        
        var messageFrame = UIView()
        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 180, height: 50))
        messageFrame.layer.cornerRadius = 15
        //messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        messageFrame.backgroundColor = UIColor.whiteColor()*/
        
        
        var actInd : UIActivityIndicatorView = UIActivityIndicatorView() 

        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        //messageFrame.addSubview(actInd)
        view.addSubview(actInd)
        view.bringSubviewToFront(actInd)
        actInd.startAnimating()
        */
        
        var query = PFQuery(className: "TwitterTags")
        var tags = query.findObjects()!
        var searchString = ""
        var endString = "%20OR%20"
        var count = 0;
        
        for tag in tags {
            
            count++
            var pfObject = tag as! PFObject
            if let tagString = pfObject["Tag"] as? NSString {
                
                if (count == tags.count) {
                    endString = ""
                }
                
                searchString = searchString + String(tagString) + endString
                
            }
        }

        
            let client = TWTRAPIClient()
            
            
            //actInd.stopAnimating()
           
            self.dataSource = TWTRSearchTimelineDataSource(searchQuery: searchString, APIClient: client)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        
            self.showTweetActions = true

        
        
            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    



    func composeTweet() {
        

        let composer = TWTRComposer()
        
        composer.setText("just setting up my Fabric")
        composer.setImage(UIImage(named: "fabric"))
        
        composer.showFromViewController(self) { result in
            if (result == TWTRComposerResult.Cancelled) {
                println("Tweet composition cancelled")
            }
            else {
                println("Sending tweet!")
            }
        }
        
        
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
