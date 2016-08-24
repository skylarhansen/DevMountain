//
//  EmailViewController.swift
//  ViewsAndStoryboards
//
//  Created by Jairo Eli de Leon on 8/15/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toWelcomeView" {
      let welcomeVC = segue.destination as? WelcomeEmailViewController
      
      if let welcomeVC = welcomeVC {
        welcomeVC.email = emailTextField.text
      }
      
    }
      
  }

}
