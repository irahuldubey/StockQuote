//
//  JSONUtilities.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Dictionary describing a JSON object
public typealias JSONDictionary = [String: AnyObject]

/// Class Description: Idea of this class is add the parsong mechanism for the different types of root object received from the Server.
/// As of now it has methods for JSONDictionary later on JSONArray can also be added upon requirement.
final class JSONUtilities {
  
  // Convert data to data to Dictionary
  ///
  /// - Parameter data: as of type Data
  /// - Returns: as of type Dictionary
  static func parseToDictionary(_ data: Data) -> JSONDictionary? {
    guard let parsedJson = try? JSONSerialization.jsonObject(with: data, options:.allowFragments) as? JSONDictionary else {
      return nil
    }
    return parsedJson
  }
}
