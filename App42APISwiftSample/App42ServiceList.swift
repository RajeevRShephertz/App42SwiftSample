//
//  App42ServiceList.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 19/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

import UIKit


class App42ServiceList: UITableViewController {

    let apiKey = "7a6b25fc1d82dc1e1d614466a1c549a6e24f4a6b9c32fbded52c0ea224b9cbc4"
    let secretKey = "0b50aaa30eb7b611462501ba087e03c7990b3713f7ad1f4b2c7cf5b247b68974"
    
    
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
        cell.textLabel.text = sortedKeys?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var cellText = cell?.textLabel.text
        if cellText == "User Service"
        {
            var userServiceAPI:UserServiceAPI = UserServiceAPI(style: UITableViewStyle.Plain)
            userServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(userServiceAPI, animated: true)
        }
        if cellText == "Game Service"
        {
            var gameServiceAPI:GameServiceAPI = GameServiceAPI(style: UITableViewStyle.Plain)
            gameServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(gameServiceAPI, animated: true)
        }
        if cellText == "Storage Service"
        {
            var storageServiceAPI:StorageServiceAPI = StorageServiceAPI(style: UITableViewStyle.Plain)
            storageServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(storageServiceAPI, animated: true)
        }
        if cellText == "PushNotification Service"
        {
            var pushServiceAPI:PushNotificationServiceAPI = PushNotificationServiceAPI(style: UITableViewStyle.Plain)
            pushServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(pushServiceAPI, animated: true)
        }
        if cellText == "Scoreboard Service"
        {
            var sbServiceAPI:ScoreboardServiceAPI = ScoreboardServiceAPI(style: UITableViewStyle.Plain)
            sbServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(sbServiceAPI, animated: true)
        }
        if cellText == "Reward Service"
        {
            var rewardServiceAPI:RewardServiceAPI = RewardServiceAPI(style: UITableViewStyle.Plain)
            rewardServiceAPI.apiList = serviceList?.objectForKey(cellText!) as? NSArray
            self.navigationController?.pushViewController(rewardServiceAPI, animated: true)
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
