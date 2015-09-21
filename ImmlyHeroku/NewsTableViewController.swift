//
//  TopicsTableViewController.swift
//  NewsFeed
//
//  Created by Bhattacharya, Dipesh on 7/15/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit
import Parse


class NewsTableViewController: UITableViewController {
    
    
    var image = UIImage()
    
    
    var arraySort:NSMutableArray = []
    
    var currentPageNumber = 1;
    var maxArticles = 100;
    var numberOfSections = 0;

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
    }
    
    
    //common function to load data
    
    func loadData() {
        
        self.tableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        /*var strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
        strLabel.text = "Loading"
        strLabel.textColor = UIColor.blackColor()
        
        var messageFrame = UIView()
        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 180, height: 50))
        messageFrame.layer.cornerRadius = 15
        //messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        messageFrame.backgroundColor = UIColor.whiteColor()*/
        

        var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50)) as UIActivityIndicatorView
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        //messageFrame.addSubview(actInd)
        view.addSubview(actInd)
        actInd.startAnimating()

        
        
        
        var url = NSURL(string: "https://immlyheroku.herokuapp.com/ios")
        
        if (currentPageNumber > 1) {
            var urlString = "https://immlyheroku.herokuapp.com/ios?p="+String(currentPageNumber);
            url = NSURL(string: urlString)

        }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if (error == nil) {
                var jsonResults = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.arraySort.addObjectsFromArray(jsonResults["Results"] as! [AnyObject])
                actInd.stopAnimating()
                //messageFrame.removeFromSuperview()
                self.tableView.reloadData()

                
            } else {    
                println(error.localizedDescription);
            }
        }
        
        task.resume()

        
    }
    
       
        
        
        //let url = NSURL(string: "https://medium.com/feed/tech-talk")


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //return xmlParser.arrParsedData.count
        return arraySort.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as! NewsCellTableViewCell
        
        if (indexPath.row < arraySort.count) {

            let currentDictionary = arraySort[indexPath.row] as! Dictionary<String, AnyObject>
            
            //println(currentDictionary["title"])
            
            //cell.textLabel?.text = currentDictionary["title"]
            //cell.companyLogo.layer.cornerRadius =  cell.companyLogo.frame.size.width / 2
            //cell.companyLogo.clipsToBounds = true
            var logo :UIImage = UIImage();
            
            if let logoURL = NSURL(string: currentDictionary["fileURL"] as! String) {
                
                if let data = NSData(contentsOfURL: logoURL) {
                    cell.companyLogo.contentMode = UIViewContentMode.ScaleAspectFit
                    cell.companyLogo.image = UIImage(data: data)
                    
                }

            }
            
            cell.title.text = currentDictionary["title"] as? String

            
            let encodedString = currentDictionary["summary"] as? String
            
            // encodedString should = a[0]["title"] in your case
            
            let encodedData = encodedString!.dataUsingEncoding(NSUTF8StringEncoding)!
            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            let attributedString = NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil, error: nil)!
            cell.descr.text = attributedString.string
        }
        
         
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dictionary: AnyObject = arraySort[indexPath.row]
        
        let tutorialLink = dictionary["link"] as? String
        
        println(tutorialLink)
        
        let tutorialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("newsdetailviewcontroller") as! NewsDetailViewController
        
        tutorialViewController.tutorialURL = NSURL(string: tutorialLink! as String)
        //tutorialViewController.performSegueWithIdentifier("showdetail", sender: self)
        
        showViewController(tutorialViewController, sender: self)
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == arraySort.count-1) {
            var articlesDisplayed = arraySort.count
            if (articlesDisplayed <= maxArticles) {
                currentPageNumber++
                loadData()
            }
        }
    }
    
    /*override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = scrollView.contentOffset;
        var bounds = scrollView.bounds;
        var size = scrollView.contentSize;
        var inset = scrollView.contentInset;
        var y:CGFloat = offset.y + bounds.size.height - inset.bottom;
        var h:CGFloat = size.height;
        // NSLog(@"offset: %f", offset.y);
        // NSLog(@"content.height: %f", size.height);
        // NSLog(@"bounds.height: %f", bounds.size.height);
        // NSLog(@"inset.top: %f", inset.top);
        // NSLog(@"inset.bottom: %f", inset.bottom);
        // NSLog(@"pos: %f of %f", y, h);
        
        var reload_distance:CGFloat = 10;
        if(y > h + reload_distance) {
            self.currentPageNumber++;
            loadData()
        }
    }*/
    



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
