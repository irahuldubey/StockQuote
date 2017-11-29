//
//  Constants.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

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

struct Utility {
  static func convertStockPrice(stockPrice: String) -> String? {
    if let doubleValue = Double(stockPrice) {
      let tradePrice = String(format: "%.2f", doubleValue)
      return "$\(tradePrice)"
    }
    return nil
  }
}
