//
//  HNEndpoint.swift
//  HNAPI
//
//  Created by lexrus on 01/28/2016.
//  Copyright (c) 2016 lexrus.com. All rights reserved.
//

// See https://github.com/HackerNews/API/blob/master/README.md

import Foundation

public enum HNEndpoint {
    case ItemById(String)
    case UserById(String)
    case MaxItemId
    case TopStories
    case NewStories
    case AskStories
    case Updates
}

extension HNEndpoint: Endpoint {
    public var baseURL: NSURL {
        return NSURL(string: "https://hacker-news.firebaseio.com/v0")!
    }

    public var path: String {
        switch self {
        case .ItemById(let id):
            return "/item/\(id).json"
        case .UserById(let id):
            return "/user/\(id).json"
        case .MaxItemId:
            return "/maxitem.json"
        case .TopStories:
            return "/topstories.json"
        case .NewStories:
            return "/newstories.json"
        case .AskStories:
            return "/askstories.json"
        case .Updates:
            return "/updates.json"
        }
    }

    public var sampleData: NSData {
        switch self {
        case .ItemById(_):
            return "{\"by\":\"dhouston\",\"descendants\": 71,\"id\": 8863,\"kids\":[8952,9224,8917],\"score\": 111,\"time\": 1175714200,\"title\":\"My YC app: Dropbox - Throw away your USB drive\",\"type\":\"story\",\"url\":\"http://www.getdropbox.com/u/2/screencast.html\"}".dataUsingEncoding(NSUTF8StringEncoding)!
        case .UserById(_):
            return "{\"about\":\"This is a test\",\"created\":1173923446,\"delay\":0,\"id\":\"jl\",\"karma\":2937,\"submitted\":[8265435,8168423]}".dataUsingEncoding(NSUTF8StringEncoding)!
        case .MaxItemId:
            return "234423".dataUsingEncoding(NSUTF8StringEncoding)!
        case .TopStories:
            return "[1212515,1234123]".dataUsingEncoding(NSUTF8StringEncoding)!
        case .NewStories:
            return "[1212515,1234123]".dataUsingEncoding(NSUTF8StringEncoding)!
        case .AskStories:
            return "[1212515,1234123]".dataUsingEncoding(NSUTF8StringEncoding)!
        case .Updates:
            return "{\"items\":[12122,123413],\"profiles\":[\"asdf\", \"lex\"]}".dataUsingEncoding(NSUTF8StringEncoding)!

        }
    }
}
