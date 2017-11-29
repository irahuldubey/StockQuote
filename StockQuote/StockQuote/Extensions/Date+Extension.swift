//
//  Date+Extension.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

extension Date{
  func toString(dateFormat format  : String ) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}
