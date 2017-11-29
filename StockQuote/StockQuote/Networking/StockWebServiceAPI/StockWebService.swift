//
//  StockWebService.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Class Description: Implements the method from StockWebServiceAPI
public final class StockWebService: StockWebServiceAPI {
  
  ///Create an instance of RestServerManager
  private let serverManager = RestServerManager()
  
  /// Initializer StockWebService
  public init() {  }
  
  /// Method Fetch the Stocks Data from the Server as per the different symbols requested
  ///
  /// - Parameters:
  ///   - symbols: set of strings which we query for
  ///   - completion: StocksServiceResponse : Has both the Success and Error Object
  /// - Throws: Throws VOID
  public func fetchStockPrices(with symbols: [String], withCompletionHandler completion: @escaping (StocksServiceResponse) -> ()) throws {
  
    ///Get the stocks URL to request from server
    let stocksURLString = RestAPIHelper.getStocksURL(for: symbols)
    
    serverManager.makeHTTPGETRequest(withURLString: stocksURLString) { (result) in
      switch result {
        case .success(dictionary: let successResponseAsDictionary):
        
        ///Guard for the Valid JSONDictionary
        guard let dictionary = successResponseAsDictionary, dictionary.count > 0 else {
          print("Class: StockService, Function: fetchStock, Fetched Stock Service : JSON is nil") // Add to Logger API Later
          let customError = StocksServiceParser.parseStockServiceCustomError(from: .invalidJSON)
          completion(.failure(error: customError))
          return
        }
        
        if let _ = dictionary[APIResponseKeys.stocks.nonfieldsErrors.rawValue] as? [AnyObject] {
          print("Class: StockService, Function: fetchStock, Fetched Stock Service : JSON is nil") // Add to Logger API Later
          let customError = StocksServiceParser.parseStockServiceCustomError(from: .invalidParameters)
          completion(.failure(error: customError))
          return
        }
        
        ///Ask the Parse class for Parsing
        let parsedResponse = StocksServiceParser.parseStocksData(from: dictionary)
        
        ///Return the result in completion Handler
        completion(.success(stocks: parsedResponse))
        
        case .failure(error: let errorResonse):
          print("Error Response received from the service\(String(describing: errorResonse))")
        
        ///Guard for the Error
        guard let error = errorResonse else {
          print("Class: StockWebService, Function: fetchStocksPrice, Error recieved is nil") // Add to Logger API Later
          completion(.failure(error: nil))
          return
        }
        ///Parse the webservice error and return to the application
        let wsError = StocksServiceParser.parseStockServiceError(from: error)
        completion(.failure(error: wsError))
      }
    }
  }
}
