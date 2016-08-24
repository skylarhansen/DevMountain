//
//  DayDetailViewController.swift
//  TableViews
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class DayDetailViewController: UIViewController {
  
  @IBOutlet weak var dayLabel: UILabel!
  
  var day: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let day = day {
      dayLabel.text = day
    }
  }
  
}
