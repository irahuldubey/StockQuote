//
//  RestServer.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/28/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

///Class that makes service calls to the server
final class RestServerManager {
  
  //Create a URL Request with the given URL
  private func getURLRequest(with url: URL) -> URLRequest {
    var request = URLRequest.init(url: url)
    request.httpMethod = RequestType.GET.rawValue
    request.timeoutInterval = Double(HTTPHeaderField.timeOut.rawValue)!
    request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    request.addValue(HTTPHeaderField.applicationJSON.rawValue,
                     forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    return request
  }
  
  ///Prevent the singleton from being initialized
  init() {
    print("Class: RestServer, Function: Initializer, Initialized RestServerManager") // Add to Logger API Later
  }
  
  ///Completion Handlers to handler data types
  typealias RestCompletionHandler = (JSONDictionary?) -> ()
  
  ///CompletionHandler JSONDictionary and Error
  typealias RestServerResultCompletionHandler = (RestResult) -> ()
  
  /// HTTP GET Request to make a service call
  ///
  /// - Parameters:
  ///   - urlString: Url String for the service
  ///   - completionHandlerDictionary: is of type Dictionary or Array from Service
  ///   - errorHandler: Throw and Error
  
  func makeHTTPGETRequest(withURLString urlString: String, completionHandler completion: @escaping RestServerResultCompletionHandler) {
    
    //Create a URL object from the URL String
    ///TODO: Need to implement ParameterEncoding (additional functionality)
    guard urlString.count > 0,
      let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
      let url = URL.init(string: encodedURLString) else {
        print("Class: RestServer, Function: makeHTTPGETRequest - Empty URL String") // Add to Logger API Later
        return
    }
    
    //Create an instance of URL Session with the default configuration
    let defaultSession = URLSession(configuration: .default)
    
    /// Create a URL Request with the given URL
    let urlRequest = getURLRequest(with: url)
    
    //Initialize a URLSessionDataTask with the query url and a completion handler to call when the data task completes.
    let dataTask = defaultSession.dataTask(with: urlRequest) { (data,response,error) in
      //Data received throw the data in completion handler
      if let data = data {
        //Check the type returned as JSONDictionary
        if let jsonDictionary = JSONUtilities.parseToDictionary(data){
          print("Class: RestServer, Function: makeHTTPGETRequest - Parsed JSON Data") // Add to Logger API Later
          completion(.success(dictionary: jsonDictionary))
        }
        else{
          /// Check for an array type, if not return nil, as of now sendig as Dictionary if not nil from here
          print("Class: RestServer, Function: makeHTTPGETRequest - Parsed JSON is not of type JSONDictionary") // Add to Logger API Later
          completion(.success(dictionary: nil))
        }
      }
      /// Error received throw the error
      if let error = error {
        ///Return completion result with Error Type
        print("Class: RestServer, Function: makeHTTPGETRequest - Failure: Error Received from WS for URL String : \(url) ") // Add to Logger API Later
        completion(.failure(error: error))
      }
    }
    ///Resume the Data Task Stock API Service
    dataTask.resume()
}
}
