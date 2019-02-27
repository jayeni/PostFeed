//
//  Post.swift
//  PostFeed
//
//  Created by Jeremiah Ayeni on 2/23/19.
//  Copyright © 2019 Jeremiah Ayeni. All rights reserved.
//


import UIKit
class Post: NSObject {
    
    var user:User?
    var postID:String?
    var postURL: String?
    var likeCount:Int?
    var descripTxt: String?
    var createdDate: String?
    
    
    init(json: [String:Any]) {
        postID = json["id"] as? String
        postURL = json["postURL"] as? String
        descripTxt = json["description"] as? String
        likeCount = json["likeCount"] as? Int
        user = User(json: json["user"] as! [String : Any])
        
        //finding diffrence between when a post to posted and current dat
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let d = dateFormatter.date(from:  json["created"] as! String )
        //determining which term fits best by how big a number is
        
        let dateSECONDS = Date().timeIntervalSince(d!)
        let dateMINS = dateSECONDS/60
        let dateHOURS = dateMINS/60
        let dateDAYS = dateHOURS/24
        let dateWEEKS = dateDAYS/7
        let dateMONTHS = dateDAYS/31
        let dateYEARS = dateWEEKS/52
        if dateSECONDS < 60 {
             createdDate = String( Int(dateSECONDS) ) + " SECONDS AGO"
            
        }
        else if dateMINS < 60{
             createdDate = String( Int(dateMINS) ) + " MINUTES AGO"
        }
        else if dateHOURS < 24{
             createdDate = String( Int(dateHOURS) ) + " HOURS AGO"
        }
        else if dateDAYS < 7{
             createdDate = String( Int(dateDAYS) ) + " DAYS AGO"
        }
        else if dateWEEKS < 52{
             createdDate = String( Int(dateWEEKS) ) + " WEEKS AGO"
        }
        else if dateMONTHS < 12{
            createdDate = String( Int(dateMONTHS) ) + " MONTHS AGO"
        }
        else{
            createdDate = String( Int(dateYEARS) ) + " YEARS AGO"
        }
 
    }
 
    
    
}
