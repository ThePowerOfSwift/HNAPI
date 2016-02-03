//
//  Update.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

import Foundation

/**
 *  The item and profile changes are at https://hacker-news.firebaseio.com/v0/updates.
 *
 *  Example: https://hacker-news.firebaseio.com/v0/updates.json?print=pretty
 */
public struct Update: DictionaryMappable {

    public let items: [Int]
    public let profiles: [String]

    public init?(_ dictionary: [String: AnyObject]) {
        guard let items = dictionary["items"] as? [Int] else {
            return nil
        }

        guard let profiles = dictionary["profiles"] as? [String] else {
            return nil
        }

        self.items = items

        self.profiles = profiles
    }

}
