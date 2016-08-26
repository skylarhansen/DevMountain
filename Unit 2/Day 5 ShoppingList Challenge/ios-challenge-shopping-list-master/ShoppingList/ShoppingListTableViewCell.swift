//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Jairo Eli de Leon on 8/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
  
  @IBOutlet weak var itemLabel: UILabel!
  @IBOutlet weak var haveItem: UIButton!
  
  weak var delegate: ListTableViewCellDelegate?
  
  var shopping: Shopping?
  
  func updateWithItem(shopping: Shopping) {
    self.shopping = shopping
    itemLabel.text = shopping.name
    
    if shopping.haveItem == true {
      haveItem.setImage(UIImage(named: "complete"), forState: .Normal)
    } else {
      haveItem.setImage(UIImage(named: "incomplete"), forState: .Normal)
    }
  }
  
  
  
  @IBAction func haveItemBoxChecked(sender: UIButton) {
    guard let list = shopping else { return }
    delegate?.haveItemValueChanged(self, haveItem: list.haveItem.boolValue)
  }
  

  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  
}

protocol ListTableViewCellDelegate: class {
  func haveItemValueChanged(cell: ShoppingListTableViewCell, haveItem: Bool)
}
