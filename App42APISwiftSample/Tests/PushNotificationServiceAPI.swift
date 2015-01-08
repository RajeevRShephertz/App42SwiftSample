//
//  PushNotificationServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class PushNotificationServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var pushNotificationService:PushNotificationService? = nil
    var sessionId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PushNotification Service"
        pushNotificationService = App42API.buildPushService() as? PushNotificationService
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
        if cellText == "RegisterDeviceToken"
        {
            RegisterDeviceToken()
        }
        else if cellText == "CreateChannelForApp"
        {
            CreateChannelForApp()
        }
        else if cellText == "SubscribeToChannel"
        {
            SubscribeToChannel()
        }
        else if cellText == "UnsubscribeFromChannel"
        {
            UnsubscribeFromChannel()
        }
        else if cellText == "SubscribeToChannelWithDeviceToken"
        {
            SubscribeToChannelWithDeviceToken()
        }
        else if cellText == "SubscribeToChannelWithTokenType"
        {
            SubscribeToChannelWithTokenType()
        }
        else if cellText == "UnsubscribeDeviceToChannel"
        {
            UnsubscribeDeviceToChannel()
        }
        else if cellText == "SendPushMessageToChannel"
        {
            SendPushMessageToChannel()
        }
        else if cellText == "SendPushMessageDictToChannel"
        {
            SendPushMessageDictToChannel()
        }
        else if cellText == "SendPushMessageToAll"
        {
            SendPushMessageToAll()
        }
        else if cellText == "SendPushMessageToiOS"
        {
            SendPushMessageToiOS()
        }
        else if cellText == "SendPushMessageToAndroid"
        {
           SendPushMessageToAndroid()
        }
        else if cellText == "SendPushMessageToUser"
        {
            SendPushMessageToUser()
        }
        else if cellText == "SendPushMessageDictToUser"
        {
            SendPushMessageDictToUser()
        }
        else if cellText == "SendPushToTargetUsers"
        {
            SendPushToTargetUsers()
        }
        else if cellText == "SendPushMessageToGroup"
        {
            SendPushMessageToGroup()
        }
        else if cellText == "SendMessageToInActiveUsersFromDate"
        {
            SendMessageToInActiveUsersFromDate()
        }
        else if cellText == "ScheduleMessageToUser"
        {
            ScheduleMessageToUser()
        }
        else if cellText == "DeleteDeviceToken"
        {
            DeleteDeviceToken()
        }
        else if cellText == "DeleteAllDevices"
        {
            DeleteAllDevices()
        }
        else if cellText == "UnsubscribeDeviceForUser"
        {
            UnsubscribeDeviceForUser()
        }
        else if cellText == "ResubscribeDeviceForUser"
        {
            ResubscribeDeviceForUser()
        }
        else if cellText == "SendPushMessageToDevice"
        {
            SendPushMessageToDevice()
        }
        else if cellText == "UpdatePushBadgeforDevice"
        {
            UpdatePushBadgeforDevice()
        }
        else if cellText == "UpdatePushBadgeforUser"
        {
            UpdatePushBadgeforUser()
        }
        else if cellText == "DeleteChannel"
        {
            DeleteChannel()
        }
    }
    func RegisterDeviceToken()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "123456"
        pushNotificationService?.registerDeviceToken(userName, withUser: userName,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
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
    func CreateChannelForApp()
    {
        NSLog("CreateChannelForApp")
        var channel = "AajTak"
        var description = "123456"
        pushNotificationService?.createChannelForApp(channel, description: description,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                    NSLog("%@", channel.description)
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
    func SubscribeToChannel()
    {
        NSLog("SubscribeToChannel")
        var channel = "AajTak"
        var userName = "HimanshuSSharma"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    func UnsubscribeFromChannel()
    {
        NSLog("CreateChannelForApp")
        var channel = "AajTak"
        var userName = "HimanshuSSharma"
        pushNotificationService?.unsubscribeFromChannel(channel, userName: userName,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    func SubscribeToChannelWithDeviceToken()
    {
        var channel = "AajTak"
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,deviceToken:deviceToken,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    func SubscribeToChannelWithTokenType()
    {
        var channel = "AajTak"
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,deviceToken:deviceToken,deviceType:"Android",{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    func UnsubscribeDeviceToChannel()
    {
        var channel = "AajTak"
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.unsubscribeDeviceToChannel(channel, userName: userName,deviceToken:deviceToken,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    
    func SendPushMessageToChannel()
    {
        var channel = "AajTak"
        var message = "HimanshuSSharma"
        pushNotificationService?.sendPushMessageToChannel(channel, withMessage:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
                var channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
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
    func SendPushMessageDictToChannel()
    {
        var channel = "AajTak"
        var message =  NSMutableDictionary()
        message["alert"] = "Hello! This is my first notification."
        message["sound"] = "default"
        message["badge"] = "2"
        pushNotificationService?.sendPushMessageToChannel(channel, withMessageDictionary:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    
    func SendPushMessageDictToUser()
    {
        var userName = "HimanshuSSharma"
        var message = NSMutableDictionary()
        message["alert"] = "Hello! This is my first notification."
        message["sound"] = "default"
        message["badge"] = "2"
        pushNotificationService?.sendPushMessageToUser(userName, withMessageDictionary:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func SendPushMessageToAll()
    {
        var message = "Hi All"
        pushNotificationService?.sendPushMessageToAll(message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func SendPushMessageToiOS()
    {
        var message = "Hi All"
        pushNotificationService?.sendPushMessageToiOS(message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func SendPushMessageToAndroid()
    {
        var message = "Hi All"
        pushNotificationService?.sendPushMessageToAndroid(message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func SendPushMessageToUser()
    {
        var userName = "HimanshuSSharma"
        var message = "Hi All"
        pushNotificationService?.sendPushMessageToUser(userName,message:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    
    func SendPushToTargetUsers()
    {
        var userName = "HimanshuSSharma"
        var message = "Hi All"
        var key = "Name"
        var value = "Nick"
        var dbName = "Test"
        var collectionName = "Demo"
        var query:Query = QueryBuilder.buildQueryWithKey(key, value:value, andOperator:APP42_OP_EQUALS)
        pushNotificationService?.sendPushToTargetUsers(message,dbName:dbName,collectionName:collectionName,query:query,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    
    func SendPushMessageToGroup()
    {
        var userName = "HimanshuSSharma"
        var userList = ["Nick",userName]
        var message = "Hi All"
        pushNotificationService?.sendPushMessageToGroup(userList,message:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    
    func ScheduleMessageToUser()
    {
        var userName = "HimanshuSSharma"
        var message = "Hi All"
        var expiryDate = NSDate()
        pushNotificationService?.scheduleMessageToUser(userName,expiryDate:expiryDate,message:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func SendMessageToInActiveUsersFromDate()
    {
        var message = "Hi All"
        var startDate = NSDate().laterDate(NSDate())
        var expiryDate = NSDate()
        pushNotificationService?.sendMessageToInActiveUsersFromDate(startDate,toDate:expiryDate,message:message,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    
    
    func DeleteDeviceToken()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.deleteDeviceToken(userName,deviceToken:deviceToken,{ (success, response, exception) -> Void in
            if(success)
            {
                var app42response = response as App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
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
    
    func DeleteAllDevices()
    {
        var userName = "HimanshuSSharma"
        pushNotificationService?.deleteAllDevices(userName,{ (success, response, exception) -> Void in
            if(success)
            {
                var app42response = response as App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
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
    
    func UnsubscribeDeviceForUser()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.unsubscribeDeviceForUser(userName,deviceToken:deviceToken,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
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
    func ResubscribeDeviceForUser()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.resubscribeDeviceForUser(userName,deviceToken:deviceToken,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
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
    func SendPushMessageToDevice()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        pushNotificationService?.sendPushMessageToDevice(deviceToken,userName:userName,message:"Hi Testing ios",{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.message)
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
    func UpdatePushBadgeforDevice()
    {
        var userName = "HimanshuSSharma"
        var deviceToken = "HimanshuSSharma"
        var badges:Int32 = 10
        pushNotificationService?.updatePushBadgeforDevice(deviceToken,userName:userName,badges:badges,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
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
    func UpdatePushBadgeforUser()
    {
        var userName = "HimanshuSSharma"
        var badges:Int32 = 10
        pushNotificationService?.updatePushBadgeforUser(userName,badges:badges,{ (success, response, exception) -> Void in
            if(success)
            {
                var pushNotification = response as PushNotification
                NSLog("%@", pushNotification.userName)
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
    func DeleteChannel()
    {
        var channel = "AajTak"
        var badges:Int32 = 10
        pushNotificationService?.deleteChannel(channel,{ (success, response, exception) -> Void in
            if(success)
            {
                var app42response = response as App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
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