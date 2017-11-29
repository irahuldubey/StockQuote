//
//  APIResponseKeys.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//


/// APIResponseKeys for the all the webservice calls
enum APIResponseKeys {
  
  //MARK: - Stocks API Response Keys
  enum stocks: String {
    case results = "results"
    case askPrice = "ask_price"
    case askSize = "ask_size"
    case bidPrice = "bid_price"
    case bidSize = "bid_size"
    case lastTradePrice = "last_trade_price"
    case lastExtendedHoursTradePrice = "last_extended_hours_trade_price"
    case previousClose = "previous_close"
    case adjustedPreviousClose = "adjusted_previous_close"
    case previousCloseDate = "previous_close_date"
    case symbol = "symbol"
    case tradingHalted = "trading_halted"
    case hasTraded = "has_traded"
    case lastTradePriceSource = "last_trade_price_source"
    case updatedAt = "updated_at"
    case instrument = "instrument"
    
    case nonfieldsErrors = "non_field_errors"
  }
}
