//
//  Item.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation

/**
 *  Stories, comments, jobs, Ask HNs and even polls are just items.
 *  They're identified by their ids, which are unique integers,
 *  and live under https://hacker-news.firebaseio.com/v0/item/.
 *
 *  Example https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty
 */
public struct Item: HNMappable {

    /// The item's unique id.
    public let id: Int!

    /// `true` if the item is deleted.
    public let deleted: Bool!

    public enum ItemType: String, RawRepresentable {
        case Job = "job"
        case Story = "story"
        case Comment = "comment"
        case Poll = "poll"
        case PollOption = "pollopt"
    }

    /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    public let type: ItemType!

    /// The username of the item's author.
    public let by: String!

    /// Creation date of the item, in Unix Time.
    public let time: NSDate?

    /// The comment, story or poll text. HTML.
    public let text: String!

    /// `true` if the item is dead.
    public let dead: Bool!

    /// The item's parent. For comments, either another comment or the relevant story. For pollopts, the relevant poll.
    public let parent: Int?

    /// The ids of the item's comments, in ranked display order.
    public let kids: [Int]?

    /// The URL of the story.
    public let url: NSURL?

    /// The story's score, or the votes for a pollopt.
    public let score: Int?

    /// The title of the story, poll or job.
    public let title: String?

    /// A list of related pollopts, in display order.
    public let parts: [Int]?

    /// In the case of stories or polls, the total comment count.
    public let descendants: Int?

    public init?(_ dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int else {
            return nil
        }

        guard let typeString = dictionary["type"] as? String,
            type = ItemType(rawValue: typeString) else {
                return nil
        }

        self.id = id

        self.deleted = dictionary["deleted"] as? Bool ?? false

        self.type = type

        self.by = dictionary["by"] as? String

        if let time = dictionary["time"] as? Double {
            self.time = NSDate(timeIntervalSince1970: time)
        } else {
            self.time = nil
        }

        self.text = dictionary["text"] as? String

        self.dead = dictionary["dead"] as? Bool ?? false

        self.parent = dictionary["parent"] as? Int

        self.kids = dictionary["kids"] as? [Int]

        if let url = dictionary["url"] as? String {
            self.url = NSURL(string: url)
        } else {
            self.url = nil
        }

        self.score = dictionary["score"] as? Int

        self.title = dictionary["title"] as? String

        self.parts = dictionary["parts"] as? [Int]

        self.descendants = dictionary["sdescendants"] as? Int
    }
    
}
