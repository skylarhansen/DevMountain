//
//  Model.swift
//  SolarSystem
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class Planet {
  
  let name: String
  let imageName: String
  let diameter: Int
  let dayLength: Float
  let millionKMsFromSun: Float
  
  
  init(name: String, imageName: String, diameter: Int, dayLength: Float, millionKMsFromSun: Float) {
    self.name = name
    self.imageName = imageName
    self.diameter = diameter
    self.dayLength = dayLength
    self.millionKMsFromSun = millionKMsFromSun
  }
  
}

