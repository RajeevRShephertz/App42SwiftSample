//
//  CatalogueServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 06/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class CatalogueServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var catalogueService:CatalogueService? = nil
    var sessionId:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Catalogue Service"
        catalogueService = App42API.buildCatalogueService() as? CatalogueService
        sessionId = nil;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (apiList?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        if cell == NSNull()
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        let index = indexPath.row
        cell.textLabel!.text = apiList?.objectAtIndex(index) as? String
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let cellText = cell?.textLabel!.text
        if cellText == "CreateUser"
        {
            //createUser()
        }
        /*else if cellText == "CreateUserWithRoles"
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
            getUsersByProfileData()
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
        }*/
    }
}
