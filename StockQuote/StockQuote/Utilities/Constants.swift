//
//  Constants.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

///Moving on if this becomes fatter we can move them to individual files, This helps in management and modifications later

/// Indentifiers for View Controllers
struct ViewControllerIdentifier {
  static let stocksHomeViewController = "StocksHomeViewController"
  static let stocksDetailViewController = "StocksDetailViewController"
}

/// Indentifiers for the Segues
struct StoryboardSegue {
  static let stocksDetailsView = "StocksDetailSegue"
}

/// Indentifiers for the Cell
struct CellIdentifier {
  static let stocksHomeCell: String = "StocksHomeCell"
}

/// Indentifiers for the StoryBoard
struct StoryboardIdentifier {
  static let main = "Main"
}

/// This can be moved to Formatter class later as of now no need to create a class for Formatter so I added to the Utility Struct
struct Utility {
  static func convertStockPrice(stockPrice: String) -> String? {
    if let doubleValue = Double(stockPrice) {
      let tradePrice = String(format: "%.2f", doubleValue)
      return "$\(tradePrice)"
    }
    return nil
  }
}
