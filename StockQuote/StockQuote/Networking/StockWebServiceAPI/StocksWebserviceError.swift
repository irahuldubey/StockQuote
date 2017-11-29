//
//  StocksWebserviceError.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

//Error Codes from the Stocks API Service
public enum StocksWebServiceErrorCodes: Int {
  
  ///Error codes and customized error messages that needs to be displayed.
  case invalidQuery = 404
  case invalidParameters = 400
  case invalidJSON = 1001
  case incompleteData = 1002
  case defaultError
  
  var displayMessage: String {
    switch self {
    case .invalidJSON:
      return "Invalid JSON Data"
    case .incompleteData:
      return "Incomplete Data"
    case .defaultError:
      return "Unable to get stock data, please try later"
    case .invalidParameters:
      return "Invalid Parameters"
    case .invalidQuery:
      return "Invalid Query"
    }
  }
}

//StocksWebService Error class, holds the error messages related to Stocks API
public struct StocksWebServiceError {
  
  /// Stocks Error Code as per the Stocks API
  public let errorCode: Int
  
  /// Error Description
  public let errorDescription: String
  
  /// Error Type Description
  public var displayError: String {
    get {
      switch errorCode {
      case 404:
        return StocksWebServiceErrorCodes.invalidQuery.displayMessage
      case 400:
        return StocksWebServiceErrorCodes.invalidParameters.displayMessage
      case 10001:
        return StocksWebServiceErrorCodes.invalidJSON.displayMessage
      case 10002:
        return StocksWebServiceErrorCodes.incompleteData.displayMessage
      default:
        return errorDescription //Handle other cases as well as of now display Error Description as default
      }
    }
  }
  
  //MARK: - StocksWebServiceError Initializer
  public init(with errorCode: Int, errorDescription: String) {
    self.errorCode = errorCode
    self.errorDescription = errorDescription
  }
}
