//
//  StocksViewModel.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

internal final class StocksViewModel {
  
  //MARK: - Properties
  
  ///Failure Binded Text
  internal private(set) var errorText: String?
  
  private let stocksWebService: StockWebServiceAPI
  
  //MARK: - Initializer
  
  /// Initializer should be private so that it should be initialized from a different class
  /// Add dependency injection so that it can be easily tested from the Test Classes
  init(withStockServiceAPI stocksWebService: StockWebServiceAPI) {
    self.stocksWebService = stocksWebService
  }
  
  func fetchStocks(for symbols: [String], withCompletionHandler completion: @escaping (_ stock: [StocksQuoteBase], _ errorString: String?) -> ()){
    
    ///Bind the symbols else return from the function
    guard symbols.count > 0 else {
      completion([], "Invalid Parameters")
      return
    }
    
    do {
      try stocksWebService.fetchStockPrices(with: symbols) {(stocksServiceResponse) in
        switch stocksServiceResponse {
          case .success(let stocksQuotesArray):
            completion(stocksQuotesArray, nil)
          case .failure(let weatherServiceError) :
            completion([], weatherServiceError?.displayError)
        }
      }
    }
    catch _ {
      ///Add to Logger Info
    }
  }
  
  //MARK: - Deinitializer
  
  deinit {
    print("Deinitialized StocksViewModel")
  }
  
  //MARK: -Table View Decoration  
}
