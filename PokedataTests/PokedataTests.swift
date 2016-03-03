//
//  PokedataTests.swift
//  PokedataTests
//
//  Created by Vinicius Valvassori on 29/02/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import XCTest
@testable import Pokedata

class PokedataTests: XCTestCase {
    
    var lm = LoginViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let expectation = expectationWithDescription("Swift Expectations")
        
        lm.loginTrainer({success in
            XCTAssertNotNil(self.lm.trainer)
            expectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(100.0, handler:nil)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
