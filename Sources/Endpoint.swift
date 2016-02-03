//
//  Endpoint.swift
//  HNAPI
//
//  Created by Lex on 2/3/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

public protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}
