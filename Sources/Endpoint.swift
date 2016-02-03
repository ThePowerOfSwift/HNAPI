//
//  Endpoint.swift
//  HNAPI
//
//  Created by lexrus on 2/3/16.
//  Copyright © 2016 lexrus.com. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var baseURL: NSURL { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    public var method: HTTPMethod {
        return .GET
    }
}
