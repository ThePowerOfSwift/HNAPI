//
//  NSURLSession+Endpoint.swift
//  HNAPI
//
//  Created by lexrus on 2/3/16.
//  Copyright © 2016 lexrus.com. All rights reserved.
//

import Foundation

public extension NSURLSession {

    public func hn_request(endpoint: HNEndpoint) -> NSURLRequest {
        let url = endpoint.baseURL.URLByAppendingPathComponent(endpoint.path)
        let request = NSURLRequest(URL: url)

        return request
    }

}