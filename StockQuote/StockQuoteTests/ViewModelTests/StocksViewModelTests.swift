//
//  StocksViewModelTests.swift
//  StockQuoteTests
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import XCTest

class StocksViewModelTests: XCTestCase {
  
  ///Additionally we can also create MOCKClass and override the MOCKService class to add any futher properties or functions
  ///Like we can add stubs and add methods for different fetch services types
  
  var stockWSViewModel: StocksViewModel?
  var mockedService: MockStockWebService?
  
  let mockStockQuoteObject = StocksQuoteBase.init(with: "84.9200", askSize: 400, bidPrice: "84.7800", bidSize: 1500, lastTradedPrice: "84.8800", lastExtendedHoursTradePrice: "84.9000", previousClose: "83.8700", adjustedPreviousClose: "83.8700", prviousCloseDate: "2017-11-27", symbol: "MSFT", tradingHalted: false, hasTraded: true, lastTradePriceSource: "consolidated", updatedAt: "2017-11-28T22:46:56Z", instrument: "https://api.robinhood.com/instruments/50810c35-d215-4866-9758-0ada4ac79ffa/")
  
  override func setUp() {
    super.setUp()
    ///Create a MOCK Service Instance
    mockedService = MockStockWebService()
    ///Create an instance of StocksViewModel
    stockWSViewModel = StocksViewModel.init(withStockServiceAPI: mockedService!)
  }
  
  override func tearDown() {
    stockWSViewModel = nil //Destroy the instance of stocksViewModel
    mockedService = nil //Destoy the instance of mockedService
    super.tearDown()
  }
  
  func testWhenSymbolsAreNilErrorIsReceived() {
    stockWSViewModel?.fetchStocks(for: [], withCompletionHandler: { (stocks, errorString) in
      XCTAssertEqual(errorString, "Invalid Parameters", "Test Failure : Parameters are Valid")
    })
  }
  
  func testWhenValidSymbolsArePassedAndFetchApiIsCalledValidStockItemsAreReturned() {

    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      completion(.success(stocks: [self.mockStockQuoteObject])
      )}
    
    stockWSViewModel?.fetchStocks(for: ["MSFT"], withCompletionHandler: { (stocksArray, errorString) in
      ///Check the success scenario
      if stocksArray.count > 0 {
        XCTAssertTrue(stocksArray.count == 1, "Stock Array is Empty" )
      }
    })
  }
  
  func testWhenInvalidSymbolsArePassedIfFailureISReturnedByService() {

    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      let customError = StocksServiceParser.parseStockServiceCustomError(from: .invalidParameters)
      completion(.failure(error: customError))
    }
    
    stockWSViewModel?.fetchStocks(for: ["ABC"], withCompletionHandler: { (stocksArray, errorString) in
      XCTAssertNotNil(errorString, "Invalid Parameters")
    })
  }
  
  func testWhenValidAndInvalidParametersAreFetchedFaliureIsReturned() {
    
    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      let customError = StocksServiceParser.parseStockServiceCustomError(from: .invalidParameters)
      completion(.failure(error: customError))
    }
    
    stockWSViewModel?.fetchStocks(for: ["ABC","MSFT"], withCompletionHandler: { (stocksArray, errorString) in
      XCTAssertNotNil(errorString, "Invalid Parameters")
    })
  }
  
  func testWhenMicrosoftStockIsQueruesSymbolReturnedIsMSFT() {
    
    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      completion(.success(stocks: [self.mockStockQuoteObject]))
    }
    
    stockWSViewModel?.fetchStocks(for: ["MSFT"], withCompletionHandler: { (stocksArray, errorString) in
      if let symbol = stocksArray.first?.symbol {
        XCTAssertEqual(symbol, "MSFT", "Test Failed: Symbol Returned is not MSFT")
      }
      else {
        XCTFail("Test Failed: No symbol returned from service")
      }
    })
  }
  
  func testValidateLastTradedPriceForMSFT() {

    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      completion(.success(stocks: [self.mockStockQuoteObject]))
    }
    
    stockWSViewModel?.fetchStocks(for: ["MSFT"], withCompletionHandler: { (stocksArray, errorString) in
      if let lastTradedPrice = stocksArray.first?.lastTradePrice {
        XCTAssertEqual("84.8800", lastTradedPrice, "Test Failed: LastTradedPrice Returned is not MSFT")
      }
      else {
        XCTFail("Test Failed: No lastTradedPrice returned from service")
      }
    })
  }
  
  func testValidateLastTradeDateForMSFT() {
    
    mockedService?.fetchStockPricesClosure = { (symbols, completion) in
      completion(.success(stocks: [self.mockStockQuoteObject]))
    }
    
    stockWSViewModel?.fetchStocks(for: ["MSFT"], withCompletionHandler: { (stocksArray, errorString) in
      if let lastDateUpadated = stocksArray.first?.updatedAt {
        XCTAssertEqual("2017-11-28T22:46:56Z", lastDateUpadated, "Test Failed: lastDateUpadated Returned is not MSFT")
      }
      else {
        XCTFail("Test Failed: No lastDateUpadated returned from service")
      }
    })
  }
}
