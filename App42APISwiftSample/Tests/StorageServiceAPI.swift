//
//  StorageServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class StorageServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var storageService:StorageService? = nil
    var objectId:NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Storage Service"
        storageService = App42API.buildStorageService() as? StorageService
        objectId = "";
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
        if cellText == "InsertDocFromJsonString"
        {
            InsertDocFromJsonString()
        }
        else if cellText == "InsertDocFromDictionary"
        {
            InsertDocFromDictionary()
        }
        else if cellText == "FindAllDocs"
        {
            FindAllDocs()
        }
        else if cellText == "FindAllDocsByPaging"
        {
            FindAllDocsByPaging()
        }
        else if cellText == "FindAllDocsCount"
        {
            FindAllDocsCount()
        }
        else if cellText == "FindAllCollections"
        {
            FindAllCollections()
        }
        else if cellText == "FindDocumentById"
        {
            FindDocumentById()
        }
        else if cellText == "FindDocumentByKeyValue"
        {
            FindDocumentByKeyValue()
        }
        else if cellText == "FindDocumentByQuery"
        {
            FindDocumentByQuery()
        }
        else if cellText == "FindDocumentsByQueryWithPaging"
        {
            FindDocumentsByQueryWithPaging()
        }
        else if cellText == "FindDocsWithQueryPagingOrderBy"
        {
            FindDocsWithQueryPagingOrderBy()
        }
        else if cellText == "UpdateDocumentByIdFromJsonString"
        {
           UpdateDocumentByIdFromJsonString()
        }
        else if cellText == "UpdateDocumentByIdFromDictionary"
        {
            UpdateDocumentByIdFromDictionary()
        }
        else if cellText == "UpdateDocumentByKeyValueFromJsonString"
        {
            UpdateDocumentByKeyValueFromJsonString()
        }
        else if cellText == "UpdateDocumentByKeyValueFromDictionary"
        {
            UpdateDocumentByKeyValueFromDictionary()
        }
        else if cellText == "UpdateDocumentByQueryFromJsonString"
        {
            UpdateDocumentByQueryFromJsonString()
        }
        else if cellText == "UpdateDocumentByQueryFromDictionary"
        {
            UpdateDocumentByQueryFromDictionary()
        }
        else if cellText == "SaveOrUpdateDocumentByKeyValueFromJsonString"
        {
            SaveOrUpdateDocumentByKeyValueFromJsonString()
        }
        else if cellText == "SaveOrUpdateDocumentByKeyValueFromDictionary"
        {
            SaveOrUpdateDocumentByKeyValueFromDictionary()
        }
        else if cellText == "DeleteAllDocuments"
        {
            DeleteAllDocuments()
        }
        else if cellText == "DeleteDocumentById"
        {
         DeleteDocumentById()
        }
        else if cellText == "DeleteDocumentsByKeyValue"
        {
            DeleteDocumentsByKeyValue()
        }
        else if cellText == "AddOrUpdateKeys"
        {
            AddOrUpdateKeys()
        }
        else if cellText == "InsertJsonDocUsingMap"
        {
            InsertJsonDocUsingMap()
        }
        else if cellText == "MapReduce"
        {
            MapReduce()
        }
    }
    
    func InsertDocFromJsonString()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var jsonString = "{\"Name\":\"Nick\",\"Age\":24}"
        App42API.setLoggedInUser(userName)
        storageService?.insertJSONDocument(dbName, collectionName: collectionName, json:jsonString, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    self.objectId = jsonDoc.docId
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func InsertDocFromDictionary()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var jsonDictionary = NSDictionary(object:"Nick", forKey:"name")
        App42API.setLoggedInUser(userName)
        storageService?.insertJSONDocument(dbName, collectionName: collectionName, dataDict:jsonDictionary, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindAllDocs()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        storageService?.findAllDocuments(dbName, collectionName: collectionName, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func FindAllDocsByPaging()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var max:Int32 = 5
        var offset:Int32 = 0
        storageService?.findAllDocuments(dbName, collectionName: collectionName, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentById()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var docId =  objectId
        storageService?.findDocumentById(dbName, collectionName: collectionName,docId:docId, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentByKeyValue()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Nick"
        storageService?.findDocumentByKeyValue(dbName, collectionName: collectionName,key:key,value:value, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentByQuery()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Nick"
        var query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocumentsByQuery(query,dbName:dbName, collectionName: collectionName, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func FindDocumentsByQueryWithPaging()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Nick"
        var max:Int32 = 5
        var offset:Int32 = 0
        var query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocumentsByQueryWithPaging(dbName, collectionName: collectionName,query:query,max:max,offset:offset, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocsWithQueryPagingOrderBy()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Nick"
        var max:Int32 = 5
        var offset:Int32 = 0
        var query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocsWithQueryPagingOrderBy(dbName, collectionName: collectionName,query:query,max:max,offset:offset,orderByKey:key,orderByType:APP42_ORDER_ASCENDING, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func UpdateDocumentByIdFromJsonString()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var docId =  objectId
        var newJSONDoc = "{\"name\":\"Himanshu Sharma\"}"
        storageService?.updateDocumentByDocId(dbName, collectionName: collectionName,docId:docId,newJsonDoc:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func UpdateDocumentByIdFromDictionary()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var docId =  objectId
        var newJSONDoc = NSDictionary(object:"Sachin Grover", forKey:"name")
        storageService?.updateDocumentByDocId(dbName, collectionName: collectionName,docId:docId,newDataDict:newJSONDoc, { (success, response, exception)   -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func UpdateDocumentByKeyValueFromJsonString()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Himanshu Sharma"
        var newJSONDoc = "{\"name\":\"Shashank Shukla\"}"
        
        storageService?.updateDocumentByKeyValue(dbName, collectionName: collectionName,key:value,value:value,newJsonDoc:newJSONDoc, { (success, response, exception)   -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func UpdateDocumentByKeyValueFromDictionary()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Shashank Shukla"
        var newJSONDoc = NSDictionary(object:"Shikha", forKey:"name")
        storageService?.updateDocumentByKeyValue(dbName, collectionName: collectionName,key:value,value:value,newDataDict:newJSONDoc, { (success, response, exception)   -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    
    func UpdateDocumentByQueryFromJsonString()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Nick"
        var newJSONDoc = "{\"name\":\"Himanshu\"}"
        var query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.updateDocumentByQuery(dbName, collectionName: collectionName,query:query,newJsonDoc:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    
    func UpdateDocumentByQueryFromDictionary()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Shikha"
        var newJSONDoc = NSDictionary(object:"Nick", forKey:"name")
        var query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.updateDocumentByQuery(dbName, collectionName: collectionName,query:query,newDataDict:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func SaveOrUpdateDocumentByKeyValueFromJsonString()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Shikha"
        var newJSONDoc = "{\"name\":\"Himanshu\"}"
        storageService?.saveOrUpdateDocumentByKeyValue(dbName, collectionName: collectionName,key:key,value:value,newJsonDoc:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func SaveOrUpdateDocumentByKeyValueFromDictionary()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Shikha"
        var newJSONDoc = NSDictionary(object:"Nick John", forKey:"name")
        storageService?.saveOrUpdateDocumentByKeyValue(dbName, collectionName: collectionName,key:key,value:value,dataDict:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func AddOrUpdateKeys()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var docId = objectId
        var newJSONDoc = NSDictionary(object:"Nock Johnsan", forKey:"name")
        storageService?.addOrUpdateKeys(dbName, collectionName: collectionName,docId:docId,dataDict:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func InsertJsonDocUsingMap()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var newJSONDoc = NSMutableDictionary()
        newJSONDoc["name"] = "Shephertz"
        newJSONDoc["age"] = 4
        storageService?.insertJsonDocUsingMap(dbName, collectionName: collectionName,map:newJSONDoc, { (success, response, exception) -> Void in
            if(success)
            {
                var storage = response as Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                var jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindAllDocsCount()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        storageService?.findAllDocumentsCount(dbName, collectionName: collectionName, { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%d", app42Response.totalRecords)
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
    func FindAllCollections()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        storageService?.findAllCollections(dbName, { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.totalRecords)
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
    
    func DeleteAllDocuments()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        storageService?.deleteAllDocuments(dbName, collectionName: collectionName, { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    
    func DeleteDocumentById()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var docId = objectId
        storageService?.deleteDocumentById(dbName, collectionName: collectionName, docId:docId, { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    func DeleteDocumentsByKeyValue()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var key = "name"
        var value = "Shephertz"
        storageService?.deleteDocumentsByKeyValue(dbName, collectionName: collectionName, key:key,value:value, { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    func MapReduce()
    {
        var userName = "HimanshuSSharma"
        var dbName = "Test"
        var collectionName = "Demo"
        var mapFunction = "function map(){ emit(this.user,1);}"
        var reduceFunction = "function reduce(key, val){var sum = 0; for(var n=0;n< val.length;n++){ sum = sum + val[n]; } return sum;}"
        storageService?.mapReduce(dbName, collectionName: collectionName,mapFunction:mapFunction ,reduceFunction:reduceFunction , { (success, response, exception) -> Void in
            if(success)
            {
                var app42Response = response as NSString
                NSLog("%@", app42Response)
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