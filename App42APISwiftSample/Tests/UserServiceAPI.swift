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
    var sessionId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Service"
        userService = App42API.buildUserService() as? UserService
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
            assignRoles()
        }
        else if cellText == "GetRolesByUser"
        {
            getRolesByUser()
        }
        else if cellText == "GetUsersByRole"
        {
            getUsersByRole()
        }
        else if cellText == "GetAllUsersCount"
        {
            getAllUsersCount()
        }
        else if cellText == "GetLockedUsersCount"
        {
            getLockedUsersCount()
        }
        else if cellText == "GetAllUsers"
        {
            getAllUsers()
        }
        else if cellText == "GetAllUsersByPaging"
        {
            getAllUserWithPaging()
        }
        else if cellText == "GetLockedUsers"
        {
            getLockedUsers()
        }
        else if cellText == "GetLockedUsersByPaging"
        {
            getLockedUsersWithPaging()
        }
        else if cellText == "GetUserByEmailId"
        {
           getUserByEmailId()
        }
        else if cellText == "CreateOrUpdateProfile"
        {
            
        }
        else if cellText == "AuthenticateUser"
        {
            authenticateUser()
        }
        else if cellText == "LockUser"
        {
            lockUser()
        }
        else if cellText == "UnlockUser"
        {
            unlockUser()
        }
        else if cellText == "ChangeUserPassword"
        {
            changeUserPassword()
        }
        else if cellText == "ResetUserPassword"
        {
            resetUserPassword()
        }
        else if cellText == "RevokeRole"
        {
            revokeRole()
        }
        else if cellText == "RevokeAllRoles"
        {
            revokeAllRoles()
        }
        else if cellText == "GetUsersByProfileData"
        {
            
        }
        else if cellText == "Logout"
        {
            logOut()
        }
        else if cellText == "DeleteUser"
        {
            deleteUser()
        }
        else if cellText == "GetUserByName"
        {
            getUser()
        }
    }
    
    func createUser()
    {
        NSLog("Create User")
        var userName = "HimanshusShephertz"
        var password = "123456"
        var emailAddress = "HimanshusShephertz@shephertz.com"
        userService?.createUser(userName, password: password, emailAddress:emailAddress) { (success, response, exception) -> Void in
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
                NSLog("%@", user.sessionId)
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
        var userName = "HimanshusShephertz12"
        var password = "123456"
        var emailAddress = "nick12.s12hephertz@shephertz.com"
        var roles = ["COO","Lead"]
        userService?.createUser(userName, password: password, emailAddress: emailAddress, roleList: roles, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.sessionId)
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
    func assignRoles()
    {
        NSLog("Assign Roles")
        var userName = "HimanshusShephertz"
        var roles = ["COO","Lead"]
        userService?.assignRoles(userName, roleList: roles, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
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
    func getUser()
    {
        NSLog("getUser")
        var userName = "HimanshusShephertz"
        userService?.getUser(userName, completionBlock: { (success, response, exception) -> Void in
            
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
    func getUserByEmailId()
    {
        NSLog("getUserByEmailId")
        var emailAddress = "HimanshusShephertz@shephertz.com"
        var roles = ["COO","Lead"]
        userService?.getUserByEmailId(emailAddress, completionBlock: { (success, response, exception) -> Void in
            
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
    func getUsersByRole()
    {
        NSLog("getUsersByRole")
        var role = "Lead"
        userService?.getUsersByRole(role, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var list = response as NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    func getRolesByUser()
    {
        NSLog("getRolesByUser")
        var userName = "HimanshusShephertz"
        userService?.getRolesByUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
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
    func getAllUsers()
    {
        NSLog("Get All Users")
        var userName = "HimanshusShephertz"
        userService?.getAllUsers({ (success, response, exception) -> Void in
            
            if(success)
            {
                var list  = response as NSArray
                
                for user in list {
                    NSLog("UserName is %@", user.userName)
                    NSLog("%@", user.email)
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
    func getAllUserWithPaging()
    {
        NSLog("getAllUsers with paging")
        var max:Int32 = 10
        var offset:Int32 = 0
        userService?.getAllUsers(max , offset: offset , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var list  = response as NSArray
                for user in list {
                    NSLog("%@", user.userName)
                    NSLog("%@", user.email)
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
    func getAllUsersCount()
    {
        NSLog("getAllUsersCount")
        var userName = "HimanshusShephertz"
        userService?.getAllUsersCount( { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.strResponse)
                NSLog("%d", user.totalRecords)
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
    func getLockedUsers()
    {
        NSLog("getLockedUsers")
        userService?.getLockedUsers({ (success, response, exception) -> Void in
            
            if(success)
            {
                var list  = response as NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    func getLockedUsersCount()
    {
        NSLog("getLockedUsersCount")
        userService?.getLockedUsersCount({ (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.strResponse)
                NSLog("%d", user.totalRecords)
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
    func getLockedUsersWithPaging()
    {
        NSLog("getLockedUsers with paging")
        var max:Int32 = 10
        var offset:Int32 = 0
        userService?.getLockedUsers(max, offset: offset , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var list  = response as NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    func revokeRole()
    {
        NSLog("revokeRole")
        var userName = "HimanshusShephertz"
        var role = "Lead"
        userService?.revokeRole(userName, role:role, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var response = response as App42Response
                NSLog("%@", response.isResponseSuccess)
                NSLog("%@", response.strResponse)
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
    func revokeAllRoles()
    {
        NSLog("revokeAllRoles")
        var userName = "HimanshusShephertz"
        userService?.revokeAllRoles(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var response = response as App42Response
                NSLog("%@", response.isResponseSuccess)
                NSLog("%@", response.strResponse)
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
    func lockUser()
    {
        NSLog("lockUser")
        var userName = "HimanshusShephertz"
        userService?.lockUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
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
    func unlockUser()
    {
        NSLog("unlockUser")
        var userName = "HimanshusShephertz"
        userService?.unlockUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
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
    func authenticateUser()
    {
        NSLog("authenticateUser")
        var userName = "HimanshusShephertz"
        userService?.authenticateUser(userName, password:"123456", completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
                NSLog("%@", user.sessionId)
                self.sessionId = user.sessionId
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
    func logOut()
    {
        NSLog("logout")
        userService?.logout(sessionId, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    func changeUserPassword()
    {
        NSLog("changeUserPassword")
        var userName = "HimanshusShephertz"
        var oldPassword = "123456"
        var newPassword = "1234567"
        userService?.changeUserPassword(userName , oldPassword:oldPassword,newPassword:newPassword, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    func resetUserPassword()
    {
        NSLog("changeUserPassword")
        var userName = "HimanshusShephertz"
        var oldPassword = "123456"
        var newPassword = "1234567"
        userService?.resetUserPassword(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    func deleteUser()
    {
        NSLog("deleteUser")
        var userName = "HimanshusShephertz"
        userService?.deleteUser(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                var user = response as App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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