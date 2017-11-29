//
//  StocksQuoteBase.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

public struct StocksQuoteBase {

  let askPrice: String
  let askSize: Int
  let bidPrice: String
  let bidSize: Int
  let lastTradePrice: String
  let lastExtendedHoursTradePrice: String
  let previousClose: String
  let adjustedPreviousClose: String
  let previousCloseDate: String
  let symbol: String
  let tradingHalted: Bool
  let hasTraded: Bool
  let lastTradePriceSource: String
  let updatedAt: String
  let instrument: String
  
  public init(with askPrice: String, askSize: Int, bidPrice: String, bidSize: Int, lastTradedPrice: String, lastExtendedHoursTradePrice: String,
              previousClose: String, adjustedPreviousClose: String, prviousCloseDate: String, symbol: String, tradingHalted: Bool, hasTraded: Bool, lastTradePriceSource: String, updatedAt: String, instrument: String) {
    
    self.askPrice = askPrice
    self.askSize = askSize
    self.bidPrice = bidPrice
    self.bidSize = bidSize
    self.lastTradePrice = lastTradedPrice
    self.lastExtendedHoursTradePrice = lastExtendedHoursTradePrice
    self.previousClose = previousClose
    self.adjustedPreviousClose = adjustedPreviousClose
    self.previousCloseDate = prviousCloseDate
    self.symbol = symbol
    self.tradingHalted = tradingHalted
    self.hasTraded = hasTraded
    self.lastTradePriceSource = lastTradePriceSource
    self.updatedAt = updatedAt
    self.instrument = instrument
    
  }
  
}
