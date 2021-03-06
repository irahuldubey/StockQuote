//
//  StockWebServiceTests.swift
//  StockQuoteTests
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import XCTest

class StockWebServiceTests: XCTestCase {
  
  ///As of now we are doing Async network call to the server and getting the response, we can also use the stubbed JSON and use the same to unit tests this class
  
  ///Instance of the StockWebService
  var stockWebService: StockWebService!
  
  override func setUp() {
    super.setUp()
    stockWebService = StockWebService()
  }
  
  override func tearDown() {
    super.tearDown()
    stockWebService = nil
  }
  
  /// Test that Fetch WebService calls returns success for the Valid Symbols sent to server
  func testFetchStockServiceCallSucceedsForValidSymbols() {
    
    let expectationObj = expectation(description: "StocksWebService")
    do {
      try stockWebService.fetchStockPrices(with: ["MSFT"], withCompletionHandler: { (stockResponse) in
        switch stockResponse {
          case .success(stocks: let stockQuotes):
            XCTAssertTrue(stockQuotes.count > 0, "Service calls is sucessful with valid result")
          case .failure(error: let serviceerror):
            XCTFail("Error received from the server\(String(describing: serviceerror))")
        }
        expectationObj.fulfill()
      })
    } catch let error {
      print("Unexpected Error recived\(error)")
    }
    ///As of now the timeout is 10.0 we can update the same later
    waitForExpectations(timeout: 10.0, handler: nil)
  }
  
  
  /// Test that Fetch WebService calls returns failure for the nil Symbols sent to server
  func testFetchStockServiceCallFailureForNilSymbols() {
    let expectationObj = expectation(description: "StocksWebService")
    do {
      try stockWebService.fetchStockPrices(with: [""], withCompletionHandler: { (stockResponse) in
        switch stockResponse {
        case .success(stocks: _): break
          ///This is the Success Scanerio and we are testing for the failure case
        case .failure(error: let serviceerror):
          XCTAssertEqual(serviceerror?.displayError, "Invalid Parameters", "Errro recived is not expected \(String(describing: serviceerror))")
          XCTAssertEqual(400, serviceerror?.errorCode, "Error Code is not expected \(String(describing: serviceerror?.errorCode))")
        }
        expectationObj.fulfill()
      })
    } catch let error {
      print("Unexpected Error recived\(error)")
    }
    ///As of now the timeout is 10.0 we can update the same later
    waitForExpectations(timeout: 10.0, handler: nil)
  }
}
