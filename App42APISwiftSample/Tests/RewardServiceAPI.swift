//
//  RewardServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class RewardServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var rewardService:RewardService? = nil
    var sessionId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Reward Service"
        rewardService = App42API.buildRewardService() as? RewardService
        sessionId = nil;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
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
        return (apiList?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        if cell == NSNull()
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        var index = indexPath.row
        cell.textLabel.text = apiList?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var cellText = cell?.textLabel.text
        if cellText == "CreateReward"
        {
            CreateReward()
        }
        else if cellText == "GetAllRewardsCount"
        {
            GetAllRewardsCount()
        }
        else if cellText == "GetAllRewardsByPaging"
        {
            GetAllRewardsByPaging()
        }
        else if cellText == "GetRewardByName"
        {
            GetRewardByName()
        }
        else if cellText == "EarnRewards"
        {
            EarnRewards()
        }
        else if cellText == "RedeemRewards"
        {
            RedeemRewards()
        }
        else if cellText == "GetGameRewardPointsForUser"
        {
            GetGameRewardPointsForUser()
        }
        else if cellText == "GetTopNRewardEarners"
        {
            GetTopNRewardEarners()
        }
        else if cellText == "GetAllRewardsByUser"
        {
            GetAllRewardsByUser()
        }
        else if cellText == "GetTopNRewardEarnersByGroup"
        {
            GetTopNRewardEarnersByGroup()
        }
        else if cellText == "GetUserRankingOnReward"
        {
            GetUserRankingOnReward()
        }
    }
    
    func CreateReward()
    {
        NSLog("createReward")
        var rewardName = "DeemedPoints"
        var description = "DeemedPoints added"
        rewardService?.createReward(rewardName, rewardDescription: description, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%@", reward.description)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetRewardByName()
    {
        NSLog("GetRewardByName")
        var rewardName = "DeemedPoints"
        rewardService?.getRewardByName(rewardName, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%@", reward.description)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetAllRewards()
    {
        NSLog("GetAllRewards")
        rewardService?.getAllRewards( { (success, response, exception) -> Void in
            if(success)
            {
                var list = response as NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%@", reward.description)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetAllRewardsByPaging()
    {
        NSLog("GetAllRewardsByPaging")
        var max:Int32 = 11
        var offset:Int32 = 0
        rewardService?.getAllRewards(max, offset: offset, { (success, response, exception) -> Void in
            if(success)
            {
                var list = response as NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%@", reward.description)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetAllRewardsCount()
    {
        NSLog("GetAllRewardsCount")
        rewardService?.getAllRewardsCount( { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as App42Response
                NSLog("%@", reward.strResponse)
                NSLog("%d", reward.totalRecords)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func EarnRewards()
    {
        NSLog("Create User")
        var rewardName = "DeemedPoints"
        var userName = "Himanshu"
        var gameName = "MorzillaTale"
        var rewardPoint:Double = 1000
        rewardService?.earnRewards(gameName, gameUserName:userName,rewardName:rewardName, rewardPoints:rewardPoint, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
        rewardService?.earnRewards(gameName, gameUserName:"Rajeev",rewardName:rewardName, rewardPoints:500, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func RedeemRewards()
    {
        NSLog("Create User")
        var rewardName = "DeemedPoints"
        var userName = "Himanshu"
        var gameName = "MorzillaTale"
        var rewardPoint:Double = 1000
        rewardService?.redeemRewards(gameName, gameUserName:userName,rewardName:rewardName, rewardPoints:rewardPoint, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetGameRewardPointsForUser()
    {
        NSLog("getGameRewardPointsForUser")
        var userName = "Himanshu"
        var gameName = "MorzillaTale"
        rewardService?.getGameRewardPointsForUser(gameName, userName: userName, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                   NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
                
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetTopNRewardEarners()
    {
        NSLog("getTopNRewardEarners")
        var rewardName = "DeemedPoints"
        var gameName = "MorzillaTale"
        rewardService?.getTopNRewardEarners(gameName, rewardName: rewardName, max:10, { (success, response, exception) -> Void in
            if(success)
            {
                var list = response as NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetAllRewardsByUser()
    {
        NSLog("GetAllRewardsByUser")
        var rewardName = "DeemedPoints"
        var userName = "Himanshu"
        rewardService?.getAllRewardsByUser(userName, rewardName: rewardName, { (success, response, exception) -> Void in
            if(success)
            {
                var list = response as NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetTopNRewardEarnersByGroup()
    {
        NSLog("GetTopNRewardEarnersByGroup")
        var rewardName = "DeemedPoints"
        var gameName = "MorzillaTale"
        var userList:NSArray = ["Himanshu","Rajeev","Sachin"]
        rewardService?.getTopNRewardEarnersByGroup(gameName, rewardName: rewardName, userList:userList, { (success, response, exception) -> Void in
            if(success)
            {
                var list = response as NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func GetUserRankingOnReward()
    {
        NSLog("getTopNRewardEarners")
        var rewardName = "DeemedPoints"
        var gameName = "MorzillaTale"
        var userName = "Himanshu"
        rewardService?.getUserRankingOnReward(gameName, rewardName: rewardName, userName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var reward = response as Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
                NSLog("%f", reward.rank)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    
    
}