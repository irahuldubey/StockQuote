//
//  StockServiceParser.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

final class StocksServiceParser {
  
  /// Parses the JSON Data as per the Stocks Base Object
  ///
  /// - Parameter jsonDictionary: JSONDictionary accepted from service
  /// - Returns: return Stocks Object
  static func parseStocksData(from jsonDictionary: JSONDictionary) -> [StocksQuoteBase] {
    
    var stocksQuoteArray = [StocksQuoteBase]()
    
    guard jsonDictionary.count > 0 else {
      print("Class: StocksServiceParser, Function: parseStocksData, JSONDictionary is nil")
      return []
    }
    
    guard let rootObject = jsonDictionary[APIResponseKeys.stocks.results.rawValue] as? Array<Dictionary<String, AnyObject>> else {
      print("Root objected is expected of type an array of dicionary")
      return []
    }
    
    rootObject.forEach { (dictionary) in
      
      let askPrice = dictionary[APIResponseKeys.stocks.askPrice.rawValue] as? String ?? ""
      let askSize = dictionary[APIResponseKeys.stocks.askSize.rawValue] as? Int ?? 0
      let bidPrice = dictionary[APIResponseKeys.stocks.bidPrice.rawValue] as? String ?? ""
      let bidSize = dictionary[APIResponseKeys.stocks.bidSize.rawValue] as? Int ?? 0
      let lastTradePrice = dictionary[APIResponseKeys.stocks.lastTradePrice.rawValue] as? String ?? ""
      let lastExtendedHoursTradePrice = dictionary[APIResponseKeys.stocks.lastExtendedHoursTradePrice.rawValue] as? String ?? ""
      let previousClose = dictionary[APIResponseKeys.stocks.previousClose.rawValue] as? String ?? ""
      let adjustedPreviousClose = dictionary[APIResponseKeys.stocks.adjustedPreviousClose.rawValue] as? String ?? ""
      let previousCloseDate = dictionary[APIResponseKeys.stocks.previousCloseDate.rawValue] as? String ?? ""
      let symbol = dictionary[APIResponseKeys.stocks.symbol.rawValue] as? String ?? ""
      let isTradingHalted = dictionary[APIResponseKeys.stocks.tradingHalted.rawValue] as? Bool ?? false
      let hasTraded = dictionary[APIResponseKeys.stocks.hasTraded.rawValue] as? Bool ?? false
      let lastTradePriceSource = dictionary[APIResponseKeys.stocks.lastTradePriceSource.rawValue] as? String ?? ""
      let updatedAt = dictionary[APIResponseKeys.stocks.updatedAt.rawValue] as? String ?? ""
      let instrument = dictionary[APIResponseKeys.stocks.instrument.rawValue] as? String ?? ""
      
      ///Create a Stocks Object with the parsed JSON values
      let stocksBaseObject = StocksQuoteBase.init(with: askPrice, askSize: askSize, bidPrice: bidPrice, bidSize: bidSize, lastTradedPrice: lastTradePrice, lastExtendedHoursTradePrice: lastExtendedHoursTradePrice, previousClose: previousClose, adjustedPreviousClose: adjustedPreviousClose, prviousCloseDate: previousCloseDate, symbol: symbol, tradingHalted: isTradingHalted, hasTraded: hasTraded, lastTradePriceSource: lastTradePriceSource, updatedAt: updatedAt, instrument: instrument)
      
      ///Append the stocks in an array
      stocksQuoteArray.append(stocksBaseObject)
    }
    
    ///Return an instance of Stocks Base Object
    return stocksQuoteArray
  }
  
  /// Parsing Stocks Error Response and Return StocksServiceError Object
  ///
  /// - Parameter error: is of type Error
  /// - Returns: is of type StocksWebServiceError
  static func parseStockServiceError(from error: Error) -> StocksWebServiceError {
    let nsError = error as NSError
    return StocksWebServiceError.init(with: nsError.code, errorDescription: nsError.localizedDescription)
  }
  
  
  /// Parse Custom Error Code and returns StocksServiceError Object
  ///
  /// - Parameter code: is of type enum ErrorCodes, custom codes from the RestClient
  /// - Returns: is of type StocksWebServiceError, object returned
  static func parseStockServiceCustomError(from code: StocksWebServiceErrorCodes) -> StocksWebServiceError {
    return StocksWebServiceError.init(with: code.rawValue, errorDescription: code.displayMessage)
  }  
}
