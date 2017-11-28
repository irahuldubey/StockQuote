//
//  StocksHomeViewController.swift
//  StockQuote
//
//  Created by Rahul Dubey on 11/27/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class StocksHomeViewController: UITableViewController {
  
  //MARK: - IBOulets
  
  
  //MARK: - Properties
  
  
  //MARK: - View Life Cycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //MARK: - Private Methods
  
  private func setUpUserInterface() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    definesPresentationContext = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.stocksHomeCell, for: indexPath) as! CustomStocksTableViewCell
    return cell
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    ///Launch the stock detail page with the company id
    performSegue(withIdentifier: StoryboardSegue.stocksDetailsView, sender: nil)
  }

  
   // MARK: - Navigation
   
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    //Guard the segue identifier else return
    guard let segueId = segue.identifier else {
      return
    }
    
    switch segueId {
      
    case StoryboardSegue.stocksDetailsView:
      if let stock = segue.destination as? StocksDetailViewController
      ///Need to update the StocksDetailViewController
    }
    default:
      break
    }
  }
}
