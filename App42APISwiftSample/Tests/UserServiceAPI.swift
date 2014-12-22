//
//  UserServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 22/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

import UIKit

class UserServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var userService:UserService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Service"
        userService = App42API.buildUserService() as? UserService
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
        cell.textLabel?.text = apiList?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        var cellText = cell?.textLabel?.text
        if cellText == "CreateUser"
        {
            createUser()
        }
        else if cellText == "CreateUserWithRoles"
        {
            createUserWithRoles()
        }
        else if cellText == "AssignRoles"
        {
            
        }
        else if cellText == "GetRolesByUser"
        {
            
        }
        else if cellText == "GetUsersByRole"
        {
            
        }
        else if cellText == "GetAllUsersCount"
        {
            
        }
        else if cellText == "GetLockedUsersCount"
        {
            
        }
        else if cellText == "GetAllUsers"
        {
            
        }
        else if cellText == "GetAllUsersByPaging"
        {
            
        }
        else if cellText == "GetLockedUsers"
        {
            
        }
        else if cellText == "GetLockedUsersByPaging"
        {
            
        }
        else if cellText == "GetUserByEmailId"
        {
            
        }
        else if cellText == "CreateOrUpdateProfile"
        {
            
        }
        else if cellText == "AuthenticateUser"
        {
            
        }
        else if cellText == "LockUser"
        {
            
        }
        else if cellText == "UnlockUser"
        {
            
        }
        else if cellText == "ChangeUserPassword"
        {
            
        }
        else if cellText == "ResetUserPassword"
        {
            
        }
        else if cellText == "RevokeRole"
        {
            
        }
        else if cellText == "RevokeAllRoles"
        {
            
        }
        else if cellText == "GetUsersByProfileData"
        {
            
        }
        else if cellText == "Logout"
        {
            
        }
        else if cellText == "CreateUserWithProfile"
        {
            
        }
        else if cellText == "GetUsersByGroup"
        {
            
        }
        else if cellText == "GetUserByName"
        {
            
        }
    }
    
    func createUser()
    {
        NSLog("Create User")
        var userName = "Nick.Shephertz"
        var password = "123456"
        var emailAddress = "nick.shephertz@shephertz.com"
        userService?.createUser(userName, password: password, emailAddress:emailAddress) { (success, response, exception) -> Void in
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        }
    }
    
    func createUserWithRoles()
    {
        NSLog("Create User With Roles")
        var userName = "Nick12.Shephertz"
        var password = "123456"
        var emailAddress = "nick12.shephertz@shephertz.com"
        var roles = ["COO","Lead"]
        userService?.createUser(userName, password: password, emailAddress: emailAddress, roleList: roles, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
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


