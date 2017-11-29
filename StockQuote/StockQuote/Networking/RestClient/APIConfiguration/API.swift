//
//  API.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// API's URL String
struct API {
  
  /// Stocks API Base URL, more things can be added on top of this as the API Matures, Using Robinhood API to get the stocks quote
  static let stocksBaseURL = "https://api.robinhood.com/quotes/?symbols={symbols}"

}
