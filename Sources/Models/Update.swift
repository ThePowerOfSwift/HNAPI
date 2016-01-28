//
//  Update.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Update: Mappable {
    
    public var items: [Int]?
    public var profiles: [String]?
    
    public init?(_ map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        items <- map["items"]
        profiles <- map["profiles"]
    }
}
