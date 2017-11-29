//
//  StocksHomeViewController.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class StocksHomeViewController: UITableViewController, ActivityIndicatorProtocol {
  
  //MARK: - IBOutlets
  
  //MARK: - Properties
  
  var activityIndicator = UIActivityIndicatorView()
  
  ///Intance of an array of StocksQuoteBase Objects
  private var stocksArray = [StocksQuoteBase]()
  
  /// Intance of the view model, View Model add the Presentation and Networking Logic to be used in this view controller.
  /// View Model is one-one mapping betweent the ViewController and ViewModel.
  private lazy var stocksViewModel = StocksViewModel(withStockServiceAPI: StockWebService())
  
  ///As of now hardcoding these stocks later on this can be searched and customized as per the user
  ///User can add stocks he is interested in and delete the stocks from his watch list as well.
  private let stocksList = ["NIKE" : "NKE",
                            "APPLE": "AAPL",
                            "GOOGLE": "GOOG",
                            "MICROSOFT" : "MSFT",
                            "FACEBOOK":"FB"]
  
  /// Return an Intance of Stock Details View Controller, Lazily Intialized, Created on Demand
  lazy var stockDetailsViewController: StocksDetailViewController = {
    let storyBoard: UIStoryboard = UIStoryboard(name: StoryboardIdentifier.main, bundle: nil)
    let stockDetailsViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifier.stocksDetailViewController) as! StocksDetailViewController
    return stockDetailsViewController
  }()
  
  //MARK: - View Life Cycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpUserInterface()
    fetchDataFromServer()
  }
  
  //MARK: - Private Methods
  
  /// Set up any custom user interface required in the view
  private func setUpUserInterface() {
    //Show Loading Indicator with Medium Size
    showLoadingIndicator(withSize: CGSize.init(width: 80, height: 80))
    tableView.tableFooterView = UIView()
  }
  
  /// Fetch the initial data from the server
  private func fetchDataFromServer() {
    let arrayOfDicionaryValues = Array(stocksList.values)
    
    stocksViewModel.fetchStocks(for: arrayOfDicionaryValues) { (stocksArray, error) in
      
      if stocksArray.count > 0 {
        self.stocksArray = stocksArray
      }
      
      DispatchQueue.main.async {
        if let error = error {
          //Show Error in the UI
          self.showAlert(withMessage: error)
        }
        self.tableView.reloadData()
        self.removeLoadingIndicator()
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocksArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.stocksHomeCell, for: indexPath) as! CustomStocksTableViewCell
    let companyNames = Array(stocksList.keys)
    cell.setUpCell(with: companyNames[indexPath.row],and: stocksArray[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.0
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    ///Launch the stock detail page with the company id
    let stockObject = stocksArray[indexPath.row]
    pushStockDetailsViewController(withObj: stockObject)
  }
  
  // MARK: - Navigation
  
  private func pushStockDetailsViewController(withObj stock: StocksQuoteBase) {
    stockDetailsViewController.setUp(withObject: stock)
    navigationController?.pushViewController(stockDetailsViewController, animated: true)
  }
  
  private func showAlert(withMessage message: String) {
    let alert = UIAlertController.init(title: "Server Error", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  
  //MARK: - Deinitializer
  
  deinit {
    print("Deinitialized StocksHomeViewController")
  }
}
