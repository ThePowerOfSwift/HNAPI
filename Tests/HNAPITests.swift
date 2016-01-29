//
//  HNAPITests.swift
//  HNAPI
//
//  Created by Lex on 1/29/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import Moya
import Alamofire
import HNAPI

class HNAPITests: XCTestCase {

    var provider: RxMoyaProvider<HNAPI>!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        provider = RxMoyaProvider(stubClosure: MoyaProvider.ImmediatelyStub)

    }

    func testUser() {
        var expectation = expectationWithDescription("fetch user")

        _ = provider.request(HNAPI.UserById("Lex")) { result in
            switch result {
            case let .Success(moyaResponse):
                let json = try moyaResponse.mapJSON()
                let user = User.init(json)
            case .Failure(error):
                XCTFail(error)
            }

            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
}
