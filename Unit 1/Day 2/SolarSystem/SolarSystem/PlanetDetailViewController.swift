//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
  
  var planet: Planet?
  
  
  @IBOutlet weak var diameterLabel: UILabel!
  @IBOutlet weak var dayLengthLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  
  @IBOutlet weak var imageView: UIImageView! {
    didSet {
      imageView.contentMode = .scaleAspectFill
      imageView.layer.cornerRadius = 30
      imageView.layer.masksToBounds = true
    }
  }
  
  func updateWithPlanet(planet: Planet) {
    title = planet.name
    imageView.image = UIImage(named: planet.imageName)
    diameterLabel.text = "\(planet.diameter) KMs"
    dayLengthLabel.text = "\(planet.dayLength) HRs"
    distanceLabel.text = "\(planet.millionKMsFromSun) million KMs"
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      if let planet = planet {
        updateWithPlanet(planet: planet)
      }
      
    }
    

}
