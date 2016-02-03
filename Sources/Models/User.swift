//
//  User.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation

/**
 *  Users are identified by case-sensitive ids,
 *  and live under https://hacker-news.firebaseio.com/v0/user/.
 *  Only users that have public activity (comments or story submissions) on the
 *  site are available through the API.
 */
public struct User: DictionaryMappable {

    /// The user's unique username. Case-sensitive. Required.
    public let id: String!

    /// Delay in minutes between a comment's creation and its visibility to other users.
    public let delay: Int?

    /// Creation date of the user, in Unix Time.
    public let created: NSDate?

    /// The user's karma.
    public let karma: Int?

    /// The user's optional self-description. HTML.
    public let about: String?

    /// List of the user's stories, polls and comments.
    public let submitted: [Int]?

    public init?(_ dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? String else {
            return nil
        }

        self.id = id

        self.delay = dictionary["delay"] as? Int

        if let created = dictionary["created"] as? Double {
            self.created = NSDate(timeIntervalSince1970: created)
        } else {
            self.created = nil
        }

        self.karma = dictionary["karma"] as? Int

        self.about = dictionary["about"] as? String

        self.submitted = dictionary["submitted"] as? [Int]
    }
    
}
