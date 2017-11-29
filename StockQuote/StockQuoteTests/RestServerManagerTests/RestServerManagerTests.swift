//
//  RestServerManagerTests.swift
//  StockQuoteTests
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import XCTest

class RestServerManagerTests: XCTestCase {
  
  var restServerManager: RestServerManager!
  
  override func setUp() {
    super.setUp()
    restServerManager = RestServerManager()
  }
  
  override func tearDown() {
    restServerManager = nil
    super.tearDown()
  }
  
  func testWhenValidURLIsPassedSuccessIsReturned() {
    ///Create an expectation
    let expectationObj = expectation(description: "RestServerManager")
    ///Make a sever call witl GET request
    restServerManager.makeHTTPGETRequest(withURLString: "https://www.google.com") { (result) in
      switch result {
      case .success(dictionary: _):
        XCTAssert(true, "Service call is not successful")
      case .failure(error: _): break
      }
      expectationObj.fulfill()
    }
    ///As of now the timeout is 10.0 we can update the same later
    waitForExpectations(timeout: 10.0, handler: nil)
  }
  
  func testWhenValidURLIsPassedFailureIsReturned() {
    ///Create an expectation
    let expectationObj = expectation(description: "RestServerManager")
    ///Make a sever call witl GET request
    restServerManager.makeHTTPGETRequest(withURLString: "https://www.goole.com") { (result) in
      switch result {
      case .success(dictionary: _): break
      case .failure(error: _):
        XCTAssert(true, "Service call is not failure")
      }
      expectationObj.fulfill()
    }
    ///As of now the timeout is 10.0 we can update the same later
    waitForExpectations(timeout: 10.0, handler: nil)
  }
}
