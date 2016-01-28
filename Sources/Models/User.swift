//
//  User.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation
import ObjectMapper

public struct User: Mappable {

    /// The user's unique username. Case-sensitive. Required.
    public var id: String?
    
    /// Delay in minutes between a comment's creation and its visibility to other users.
    public var delay: Int?
    
    /// Creation date of the user, in Unix Time.
    public var created: NSDate?
    
    /// The user's karma.
    public var karma: Int?
    
    /// The user's optional self-description. HTML.
    public var about: String?
    
    /// List of the user's stories, polls and comments.
    public var submitted: [Int]?
    
    public init?(_ map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        about <- map["about"]
        created <- (map["created"], DateTransform())
        delay <- map["delay"]
        id <- map["id"]
        karma <- map["karma"]
        submitted <- map["submitted"]
    }
}
