//
//  CustomStocksTableViewCell.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

internal final class CustomStocksTableViewCell: UITableViewCell {
  
  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var companyStockPrice: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  /// Decorate the cell with the given values
  ///
  /// - Parameter model: Model Object that holds the data needs to passed in here.
  func setUpCell(with companyName: String, and model: StocksQuoteBase) {
    self.companyName.text = companyName
    companyStockPrice.text = Utility.convertStockPrice(stockPrice: model.lastTradePrice)
    companyStockPrice.textColor = model.lastTradePrice > model.previousClose ? UIColor.green : UIColor.red
  }
}
