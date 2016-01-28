//
//  HNAPIProviderSpec.swift
//  HNAPI
//
//  Created by Lex on 1/28/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Moya
import RxSwift
import Alamofire
import HNAPI
import Moya_ObjectMapper

class HNAPIProviderSpec: QuickSpec {
    override func spec() {
        
        describe("stub test with Observable") {
            
            var provider: RxMoyaProvider<HNAPI>!
            
            beforeEach {
                provider = RxMoyaProvider(stubClosure: MoyaProvider.ImmediatelyStub)
            }
            
            it("returns a Update object") {
                var called = false
                
                _ = provider.request(.Updates).mapObject(Update).subscribeNext { update in
                    expect(update.items?.count).to(beGreaterThan(0))
                    called = true
                }
                
                expect(called).to(beTruthy())
            }
            
            it("returns a User object") {
                var called = false
                
                _ = provider.request(.User("Lex")).mapObject(User).subscribeNext { user in
                    expect(user.id).toNot(beNil())
                    expect(user.created?.timeIntervalSince1970).to(beGreaterThan(1000))
                    called = true
                }
                
                expect(called).to(beTruthy())
            }
            
            it("returns a Item object") {
                var called = false
                
                _ = provider.request(.Item("12416")).mapObject(Item).subscribeNext { item in
                    expect(item.id).toNot(beNil())
                    expect(item.time?.timeIntervalSince1970).to(beGreaterThan(1000))
                    expect(item.type).toNot(beNil())
                    called = true
                }
                
                expect(called).to(beTruthy())
            }
        }
    
    }
}
