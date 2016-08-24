//
//  ViewController.swift
//  Flashlight
//
//  Created by Jairo Eli de Leon on 8/15/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var isOn: Bool = false
  
  @IBOutlet weak var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  @IBAction func buttonTapped(_ sender: AnyObject) {
    
    if isOn {
      self.isOn = false
      
      self.button.setTitle("On", for: .normal)
      self.button.setTitleColor(.white, for: .normal)
      self.view.backgroundColor = .black
      
    } else {
      self.isOn = true
      
      self.button.setTitle("Off", for: .normal)
      self.button.setTitleColor(.black, for: .normal)
      self.view.backgroundColor = .white
    
    }
    
  }
  

}
