//
//  RestAPIHelper.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Rest API Helper for parsing
struct RestAPIHelper {
  
  /// Get Stocks API URL String
  ///
  /// - Parameters:
  ///   - stocks: is of type Array of String  List of symbols to be called for the API
  /// - Returns: is of type String, Return the complete URL String
  static func getStocksURL(for stocks: [String]) -> String {
    let baseAPIURL = API.stocksBaseURL
    let symbolsAsString = stocks.joined(separator: ",")
    let urlWithSymbol = baseAPIURL.replacingOccurrences(of: APIParams.stocks.symbols.rawValue, with: symbolsAsString)
    return urlWithSymbol
  }
}
