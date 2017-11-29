//
//  CustomStocksTableViewCell.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

internal final class CustomStocksTableViewCell: UITableViewCell {
  
  ///is of type UILabel, get the Company Name
  @IBOutlet weak var companyName: UILabel!
  ///is of type UILabel, get the Company Stock Price
  @IBOutlet weak var companyStockPrice: UILabel!
  
  ///Any initialization on start up, when view is loaded from the NIB
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  /// Decorate the cell with the given values
  /// - Parameter companyName: is of type String, get the company name which is presented
  /// - Parameter model: Model Object that holds the data needs to passed in here.
  func setUpCell(with companyName: String, and model: StocksQuoteBase) {
    self.companyName.text = companyName
    companyStockPrice.text = Utility.convertStockPrice(stockPrice: model.lastTradePrice)
    companyStockPrice.textColor = model.lastTradePrice > model.previousClose ? UIColor.green : UIColor.red
  }
}
