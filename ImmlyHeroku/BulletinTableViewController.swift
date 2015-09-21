//
//  BulletinTableViewController.swift
//  ImmlyHeroku
//
//  Created by Bhattacharya, Dipesh on 9/11/15.
//  Copyright (c) 2015 Immly. All rights reserved.
//

import UIKit

class BulletinTableViewController: UITableViewController {

    
    
    var arraySort:NSArray = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        self.tableView.tableFooterView = UIView()
        
        
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
        //self.tableView.tableHeaderView = actInd
        actInd.startAnimating()
        
        
        let url = NSURL(string: "https://immlyheroku.herokuapp.com/iostrack")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if (error == nil) {
                var jsonResults = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.arraySort = jsonResults["results"] as! NSArray
                actInd.stopAnimating()
                self.tableView.reloadData()
                
                
            } else {
                println(error.localizedDescription);
            }
        }
        
        
        task.resume()


    }

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
        return arraySort.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idBulletinCell", forIndexPath: indexPath) as! ForumTableViewCell
        
        
        cell.inCutOff.text = convertDateFormater((self.arraySort[indexPath.row]["INCutoffDate"] as? String)!)
        cell.cnCutOff.text = convertDateFormater((self.arraySort[indexPath.row]["CNCutoffDate"] as? String)!)
        cell.mxCutOff.text = convertDateFormater((self.arraySort[indexPath.row]["MXCutoffDate"] as? String)!)
        cell.rowCutOff.text = convertDateFormater((self.arraySort[indexPath.row]["PHCutoffDate"] as? String)!)
        cell.gcType.text = self.arraySort[indexPath.row]["EB"] as? String
        cell.bulletinDate.text = self.arraySort[indexPath.row]["BulletinDate"] as? String
        
        cell.indiaImg.image = UIImage(named:"india.png")
        cell.cnImg.image = UIImage(named:"china.png")
        cell.mxImg.image = UIImage(named:"mx.png")
        cell.phImg.image = UIImage(named: "ph.png")



        // Configure the cell...

        return cell
    }
    
    func convertDateFormater(date: String) -> String
    {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let date = dateFormatter.dateFromString(date)
        
        
        dateFormatter.dateFormat = "MMM dd','yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(date!)
        
        
        return timeStamp
    }


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
