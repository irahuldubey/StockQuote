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
  
  
  /// StocksQuoteBase Initializer
  ///
  /// - Parameters:
  ///   - askPrice: is of type String, get the ask price of the Company Queried
  ///   - askSize: is of type Int, get the ask size of the Company Queried
  ///   - bidPrice: is of type String, get the bid price of the Company Queried
  ///   - bidSize: is of type Int, get the bid price of the Company Queried
  ///   - lastTradedPrice: is of type String, get the lastTradedPrice price of the Company Queried
  ///   - lastExtendedHoursTradePrice: is of type String, get the lastExtendedHoursTradePrice price of the Company Queried
  ///   - previousClose: is of type String, get the previousClose price of the Company Queried
  ///   - adjustedPreviousClose: is of type String, get the adjustedPreviousClose price of the Company Queried
  ///   - previousCloseDate: is of type String, get the previousCloseDate price of the Company Queried
  ///   - symbol: is of type String, get the Symbol price of the Company Queried
  ///   - tradingHalted: is of type Bool, get the TradingHalted price of the Company Queried
  ///   - hasTraded: is of type Bool, get the hasTraded price of the Company Queried
  ///   - lastTradePriceSource: is of type String, get the lastTradePriceSource price of the Company Queried
  ///   - updatedAt: is of type String, get the updatedAt price of the Company Queried
  ///   - instrument: is of type String, get the instrument price of the Company Queried
  
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
