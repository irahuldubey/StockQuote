//
//  StockQuoteUITests.swift
//  StockQuoteUITests
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import XCTest

class StockQuoteUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    app = XCUIApplication()
    
    ///Launch the application
    app.launch()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testRowTitleAsAppleExists() {
    XCTAssertTrue(app.staticTexts["APPLE"].exists, "Apple does not exist as one of the key for stocks")
  }
  
  func testRowTitleAsNIKEExists() {
    XCTAssertTrue(app.staticTexts["NIKE"].exists, "NIKE does not exist as one of the key for stocks")
  }
  
  func testRowTitleAsFACEBOOKExists() {
    XCTAssertTrue(app.staticTexts["FACEBOOK"].exists, "FACEBOOK does not exist as one of the key for stocks")
  }
  
  func testRowTitleAsGOOGLEExists() {
    XCTAssertTrue(app.staticTexts["GOOGLE"].exists, "GOOGLE does not exist as one of the key for stocks")
  }
  
  func testRowTitleAsMICROSOFTExists() {
    XCTAssertTrue(app.staticTexts["MICROSOFT"].exists, "MICROSOFT does not exist as one of the key for stocks")
  }
  
  func testIfStockDetailPageIsPresented() {
    app.staticTexts["FACEBOOK"].tap()
    XCTAssertTrue(app.navigationBars["Stock Detail"].exists, "Stocks Details is not Presented")
  }
  
  func testIfHomePageIsPrensentedWithTitleStockWatchlist() {
    XCTAssertTrue(app.navigationBars["Stocks Watchlist"].exists, "Stocks Details is not Presented")
  }
  
  func testRowTitleAsApple() {
    app.staticTexts["APPLE"].tap()
    XCTAssert(app.staticTexts["AAPL"].exists)
  }
  
  func testRowTitleAsNIKE() {
    app.staticTexts["NIKE"].tap()
    XCTAssert(app.staticTexts["NKE"].exists)
  }
  
  func testRowTitleAsFACEBOOK() {
    app.staticTexts["FACEBOOK"].tap()
    XCTAssert(app.staticTexts["FB"].exists)
  }
  
  func testRowTitleAsGOOGLE() {
    app.staticTexts["GOOGLE"].tap()
    XCTAssert(app.staticTexts["GOOG"].exists)
  }
  
  func testRowTitleAsMICROSOFT() {
    app.staticTexts["MICROSOFT"].tap()
    XCTAssert(app.staticTexts["MSFT"].exists)
  }
}
