//
//  StocksDetailViewController.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var previousCloseDate: UILabel!
  @IBOutlet weak var previousClosePrice: UILabel!
  @IBOutlet weak var afterHoursPrice: UILabel!
  @IBOutlet weak var currentPrice: UILabel!
  @IBOutlet weak var companySymbol: UILabel!
  @IBOutlet weak var lastUpdatedTime: UILabel!
  
  //MARK: Properties
  private var stock: StocksQuoteBase?
  
  //MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    
    guard let stock = stock else {
      return
    }
    
    ///Update the Outlets
    companySymbol.text = stock.symbol
    previousClosePrice.text = Utility.convertStockPrice(stockPrice: stock.previousClose)
    afterHoursPrice.text = Utility.convertStockPrice(stockPrice: stock.lastExtendedHoursTradePrice)
    currentPrice.text = Utility.convertStockPrice(stockPrice: stock.lastTradePrice)
    previousCloseDate.text = stock.previousCloseDate
    companySymbol.textColor = stock.lastTradePrice > stock.previousClose  ? .green : .red
    
    let dateFormatter = ISO8601DateFormatter()
    if let date = dateFormatter.date(from: stock.updatedAt) {
      let dateformat = DateFormatter()
      dateformat.dateFormat = "LLL d, yyyy - HH:mm:ss zzz"
      dateformat.timeZone = TimeZone.current
      lastUpdatedTime.text = "Last Updated \(dateformat.string(from: date))"
    }
  }
  
  //MARK: Memory Pressure
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func setUp(withObject stockObj: StocksQuoteBase) {
    stock = stockObj
  }
  
  //MARK: - Deinitializer
  
  deinit {
    print("Deinitialized StocksDetailViewController")
  }
}
