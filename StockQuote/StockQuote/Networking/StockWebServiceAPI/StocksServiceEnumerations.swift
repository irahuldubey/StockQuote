//
//  StocksServiceEnumerations.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

//MARK: - Stocks API Service Response
public enum StocksServiceResponse {
  ///Success Response from the Stocks Service
  case success(stocks: [StocksQuoteBase])
  ///Failure Response from the Stocks Service sending Error
  case failure(error: StocksWebServiceError?)
}

//MARK: - Stocks API Data Error
public enum DataError: Error {
  /// This case is returned when we get an unexpected response from a service
  case invalidResponse
  /// This case is returned in all errors when accessing Stocks API.
  case invalidJSONData
  /// This case returns when we dont have complete information from the service.
  case incompleteData
}
