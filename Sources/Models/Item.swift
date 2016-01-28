//
//  Item.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation
import ObjectMapper

public enum ItemType: String, RawRepresentable {
    case Job = "job"
    case Story = "story"
    case Comment = "comment"
    case Poll = "poll"
    case PollOption = "pollopt"
}

public struct Item: Mappable {
    
    /// The item's unique id.
    public var id: Int?
    
    /// `true` if the item is deleted.
    public var deleted: Bool = false
    
    /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    public var type: ItemType?
    
    /// The username of the item's author.
    public var by: String?
    
    /// Creation date of the item, in Unix Time.
    public var time: NSDate?
    
    /// The comment, story or poll text. HTML.
    public var text: String?
    
    /// `true` if the item is dead.
    public var dead: Bool = false
    
    /// The item's parent. For comments, either another comment or the relevant story. For pollopts, the relevant poll.
    public var parent: Int?
    
    /// The ids of the item's comments, in ranked display order.
    public var kids: [Int]?
    
    /// The URL of the story.
    public var url: String?
    
    /// The story's score, or the votes for a pollopt.
    public var score: Int?
    
    /// The title of the story, poll or job.
    public var title: String?
    
    /// A list of related pollopts, in display order.
    public var parts: [Int]?
    
    /// In the case of stories or polls, the total comment count.
    public var descendants: Int?
    
    public init?(_ map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        deleted <- map["deleted"]
        type <- map["type"]
        by <- map["by"]
        time <- (map["time"], DateTransform())
        text <- map["text"]
        dead <- map["dead"]
        parent <- map["parent"]
        kids <- map["kids"]
        url <- map["url"]
        score <- map["score"]
        title <- map["title"]
        parts <- map["parts"]
        descendants <- map["descendants"]
    }
}
