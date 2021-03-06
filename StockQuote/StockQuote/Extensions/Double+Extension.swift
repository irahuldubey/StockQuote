//
//  Double+Extension.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

// MARK: - Extension Double
extension Double {
  
  /// Double value to string
  ///
  /// - Returns: return the double value to string
  func toString() -> String {
    return String(format: "%.2f",self)
  }
}
