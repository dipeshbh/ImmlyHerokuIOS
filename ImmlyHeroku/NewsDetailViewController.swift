//
//  TutorialViewController.swift
//  NewsFeed
//
//  Created by Bhattacharya, Dipesh on 7/15/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
   
    @IBOutlet weak var webview: UIWebView!
    
    //@IBOutlet weak var toolbar: UIToolbar!
    
  
    
    var tutorialURL : NSURL!
    
    
    @IBAction func showPublishDate(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.hidden = true
        //toolbar.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.tutorialURL != nil {
            
            let request = NSURLRequest(URL: self.tutorialURL) as NSURLRequest!
            webview.loadRequest(request)
            
            if webview.hidden {
                webview.hidden = false
                //toolbar.hidden = false
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
