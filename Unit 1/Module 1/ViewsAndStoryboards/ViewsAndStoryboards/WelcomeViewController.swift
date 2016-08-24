//
//  WelcomeViewController.swift
//  ViewsAndStoryboards
//
//  Created by Jairo Eli de Leon on 8/15/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  
  @IBOutlet weak var nameLabel: UILabel! {
    didSet {
      nameLabel.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
