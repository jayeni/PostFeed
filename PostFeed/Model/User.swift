//
//  User.swift
//  PostFeed
//
//  Created by Jeremiah Ayeni on 2/24/19.
//  Copyright © 2019 Jeremiah Ayeni. All rights reserved.
//

import UIKit

class User: NSObject {
    

    var id:Int?
    var name: String?
    var avatarURL: String?
  
    
    init(json: [String:Any]) {
        id = json["id"] as? Int
        name = json["name"] as? String
        avatarURL = json["avatarURL"] as? String
        
    }
    
    
    
}
