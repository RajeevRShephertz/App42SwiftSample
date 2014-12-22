//
//  App42ServiceList.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 19/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

import UIKit


class App42ServiceList: UITableViewController {

    let apiKey = "67359321652c10b15fd5f659d096a2051745aa4f339b936d6ce5dccb165de863"
    let secretKey = "2d44878dd428046f23bd4b3807ce83e982db9900f4c5a8305255da4764c76610"
    
    
    var serviceList:NSDictionary? = nil
    var sortedKeys:NSArray? = nil
    
    var servicesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /***
         * Innitialising App42API
         */
        App42API.initializeWithAPIKey(apiKey, andSecretKey: secretKey)
        App42API.enableApp42Trace(true)
        App42API.setOfflineStorage(true)
        App42CacheManager.sharedCacheManager().setPolicy(APP42_NETWORK_FIRST)
        
        /*** Initialised ***/
        
        self.navigationItem.title = "App42 Services"
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        var filePath:String = NSBundle.mainBundle().pathForResource("App42Services", ofType: "plist")!
        
        serviceList = NSDictionary(contentsOfFile: filePath)!
        servicesCount = (serviceList?.count)!
        var allKeys:NSMutableArray = NSMutableArray(array: (serviceList?.allKeys)!)
        
        sortedKeys = allKeys.sortedArrayUsingSelector(Selector("caseInsensitiveCompare:"))
        //NSLog("%@", sortedKeys!)
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
        // #warning Incomplete method implementation.~
        // Return the number of rows in the section.
        return servicesCount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        var index = indexPath.row
        cell.textLabel?.text = sortedKeys?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var cellText = cell?.textLabel?.text
        if cellText == "User Service"
        {
            var userServiceAPI:UserServiceAPI = UserServiceAPI(style: UITableViewStyle.Plain)
            userServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(userServiceAPI, animated: true)
        }
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
