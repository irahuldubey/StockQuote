//
//  MOCKStockWebService.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Class Description: MOCK class for the webservice calls from the client, wrapped in a protocol.
final class MockStockWebService: StockWebServiceAPI {
  
  ///Create an instance of closure property
  var fetchStockPricesClosure: (( _ symbols: [String], _ completion: (StocksServiceResponse) -> ()) -> ())?
  
  ///Override the main method from the StockServiceAPI
  func fetchStockPrices(with symbols: [String], withCompletionHandler completion: @escaping (StocksServiceResponse) -> ()) throws {
    fetchStockPricesClosure?(symbols, completion)
  }
}
