//
//  ScoreboardServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class ScoreboardServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var scoreBoardService:ScoreBoardService? = nil
    var editScoreId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Service"
        scoreBoardService = App42API.buildScoreBoardService() as? ScoreBoardService
        editScoreId = nil;
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
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        if cell == NSNull()
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        var index = indexPath.row
        cell.textLabel!.text = apiList?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var cellText = cell?.textLabel!.text
        if cellText == "SaveUserScore"
        {
            SaveUserScore()
        }
        else if cellText == "GetScoresByUser"
        {
            GetScoresByUser()
        }
       /* else if cellText == "GetHighestScoreByUser"
        {
            GetHighestScoreByUser()
        }
        else if cellText == "GetLowestScoreByUser"
        {
            GetLowestScoreByUser()
        }
        else if cellText == "GetAverageScoreByUser"
        {
            GetAverageScoreByUser()
        }
        else if cellText == "GetTopRankings"
        {
            GetTopRankings()
        }
        else if cellText == "GetTopRankersByGroup"
        {
            GetTopRankersByGroup()
        }
        else if cellText == "GetTopRankingsByGroup"
        {
            GetTopRankingsByGroup()
        }
        else if cellText == "GetTopRankingsInDateRange"
        {
            GetTopRankingsInDateRange()
        }
        else if cellText == "GetTopNRankersInDateRange"
        {
            GetTopNRankersInDateRange()
        }
        else if cellText == "GetLastGameScore"
        {
           GetLastGameScore()
        }
        else if cellText == "GetUserRanking"
        {
          GetUserRanking()
        }
        else if cellText == "GetLastScoreByUser"
        {
            GetLastScoreByUser()
        }
        else if cellText == "EditScoreValueById"
        {
            EditScoreValueById()
        }
        else if cellText == "GetTopRankersFromBuddyGroup"
        {
            GetTopRankersFromBuddyGroup()
        }
        else if cellText == "GetTopNRankersFromFacebook"
        {
            GetTopNRankersFromFacebook()
        }
        else if cellText == "GetTopNRankersFromFacebookInDateRange"
        {
            GetTopNRankersFromFacebookInDateRange()
        }
        else if cellText == "GetTopNTargetRankers"
        {
            GetTopNTargetRankers()
        }
        else if cellText == "GetUsersWithScoreRange"
        {
            GetUsersWithScoreRange()
        }
        else if cellText == "GetTopNRankers"
        {
            GetTopNRankers()
        }*/
    }
    
    func SaveUserScore()
    {
        var gameName = "Platformer"
        var userName = "123456"
        var score:Double = 2000
        scoreBoardService?.saveUserScore(gameName,gameUserName:userName,gameScore:score, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as! Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
                    self.editScoreId = score.scoreId
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
    func GetScoresByUser()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getScoresByUser(gameName,gameUserName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as! Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
   /* func GetHighestScoreByUser()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getHighestScoreByUser(gameName,gameUserName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetLowestScoreByUser()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getLowestScoreByUser(gameName,gameUserName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetAverageScoreByUser()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getAverageScoreByUser(gameName,userName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
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
    func GetTopRankings()
    {
        var gameName = "Platformer"
        scoreBoardService?.getTopRankings(gameName,{ (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopRankersByGroup()
    {
        var gameName = "Platformer"
        var userList = ["Himanshu","Nick","123456"]
        scoreBoardService?.getTopRankersByGroup(gameName,group:userList,{ (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopRankingsByGroup()
    {
        var gameName = "Platformer"
        var userList = ["Himanshu","Nick","123456"]
        scoreBoardService?.getTopRankingsByGroup(gameName,group:userList,{ (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopRankingsInDateRange()
    {
        var gameName = "Platformer"
        var startDate = NSDate().laterDate(NSDate())
        var endDate = NSDate()
        scoreBoardService?.getTopRankings(gameName,startDate:startDate,endDate:endDate,{ (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopNRankersInDateRange()
    {
        var gameName = "Platformer"
        var startDate = NSDate().laterDate(NSDate())
        var endDate = NSDate()
        var max:Int32 = 10
        
        scoreBoardService?.getTopNRankers(gameName,startDate:startDate,endDate:endDate,max:max, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetLastGameScore()
    {
        var userName = "Nick"
        scoreBoardService?.getLastGameScore(userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetUserRanking()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getUserRanking(gameName,userName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetLastScoreByUser()
    {
        var gameName = "Platformer"
        var userName = "123456"
        scoreBoardService?.getLastScoreByUser(gameName,userName:userName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func EditScoreValueById()
    {
        var scoreId = editScoreId
        var score:Double = 9000
         scoreBoardService?.editScoreValueById(scoreId,gameScore:score, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopRankersFromBuddyGroup()
    {
        var gameName = "Platformer"
        var userName = "Nick"
        var ownerName = "Nick"
        var groupName = "Group Name"
        scoreBoardService?.getTopRankersFromBuddyGroup(gameName,userName:userName,ownerName:ownerName,groupName:groupName, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopNRankersFromFacebook()
    {
        var gameName = "Platformer"
        var accessToken = ""
        var max:Int32 = 10
        scoreBoardService?.getTopNRankersFromFacebook(gameName,fbAccessToken:accessToken,max:max, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopNRankersFromFacebookInDateRange()
    {
        var gameName = "Platformer"
        var accessToken = ""
        var max:Int32 = 10
        var startDate = NSDate().laterDate(NSDate())
        var endDate = NSDate()
        scoreBoardService?.getTopNRankersFromFacebook(gameName,fbAccessToken:accessToken,startDate:startDate,endDate:endDate,max:max, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopNTargetRankers()
    {
        var gameName = "Platformer"
        var max:Int32 = 10
        scoreBoardService?.getTopNTargetRankers(gameName,max:max, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetUsersWithScoreRange()
    {
        var gameName = "Platformer"
        var minScore:Double = 10
        var maxScore:Double = 5000
        scoreBoardService?.getUsersWithScoreRange(gameName,minScore:minScore,maxScore:maxScore, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    func GetTopNRankers()
    {
        var gameName = "Platformer"
        var max:Int32 = 10
        scoreBoardService?.getTopNRankers(gameName,max:max, { (success, response, exception) -> Void in
            if(success)
            {
                var game = response as Game
                NSLog("%@", game.name)
                var scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    // NSLog("%f", score.value)
                    NSLog("%@", score.scoreId)
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
    */
    
}