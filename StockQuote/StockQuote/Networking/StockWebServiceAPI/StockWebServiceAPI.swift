
//
//  StockWebServiceAPI.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Protocol: StockWebServiceAPI declares the method used in the service calls it will be implemented by the class and can be used in MOCKServices for the purpose of testability. Implementing for the composition is better in this scenario.
public protocol StockWebServiceAPI {
  
  /// Method to Fetch the Stock Price for the given set of symbols as String
  ///
  /// - Parameter completion: CompletionHandler : Success and Error Objects from the server
  /// - Returns: Void
  /// - Throws: Void
  func fetchStockPrices(with symbols: [String], withCompletionHandler completion: @escaping (StocksServiceResponse) -> ()) throws -> Void
  
}
