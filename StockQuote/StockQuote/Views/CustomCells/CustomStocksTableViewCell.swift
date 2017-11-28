//
//  CustomStocksTableViewCell.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class CustomStocksTableViewCell: UITableViewCell {
  
  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var companyStockPrice: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
