//
//  HNAPITests.swift
//  HNAPI
//
//  Created by Lex on 1/29/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

class HNAPITests: XCTestCase {

    let session = NSURLSession.sharedSession()

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
    }

    func testStabUser() {
        let userEndpoint: HNEndpoint = .UserById("Lex")
        do {
            if let dictionary = try NSJSONSerialization.JSONObjectWithData(
                userEndpoint.sampleData,
                options: [.AllowFragments]) as? [String: AnyObject] {
                    if let user = User(dictionary) {
                        XCTAssert(user.id.characters.count > 0)
                        return
                    }
            }
        } catch { }

        XCTFail("Failed to init User.")
    }

    func testUser() {
        var expectation = expectationWithDescription("fetch user")

        let userEndpoint: HNEndpoint = .UserById("jl")
        let request = session.hn_request(userEndpoint)

        session.dataTaskWithRequest(request) { (data, response, error) in
            defer {
                expectation.fulfill()
            }

            if error != nil {
                XCTFail(error!.description)
            }

            guard let data = data else { return }

            guard let dictionary = try? NSJSONSerialization.JSONObjectWithData(
                data,
                options: [.AllowFragments]) as! [String: AnyObject] else { return }

            guard let user = User(dictionary) else { return }

            XCTAssert(user.about?.characters.count > 0)
        }.resume()

        waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
}
