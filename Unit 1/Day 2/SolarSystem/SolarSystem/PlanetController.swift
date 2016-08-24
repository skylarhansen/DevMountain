//
//  PlanetController.swift
//  SolarSystem
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class PlanetController {
  
  static var planets: [Planet] {
    let mercury = Planet(name: "Mercury", imageName: "mercury", diameter: 4879, dayLength: 4222.6, millionKMsFromSun: 57.9)
    
    let venus = Planet(name: "Venus", imageName: "venus", diameter: 12104, dayLength: 2802, millionKMsFromSun: 108.2)
    
    let earth = Planet(name: "Earth", imageName: "earth", diameter: 12756, dayLength: 24, millionKMsFromSun: 149.6)
    
    let mars = Planet(name: "Mars", imageName: "mars", diameter: 6792, dayLength: 24.7, millionKMsFromSun: 227.9)
    
    let jupiter = Planet(name: "Jupiter", imageName: "jupiter", diameter: 142984, dayLength: 9.9, millionKMsFromSun: 778.6)
    
    let saturn = Planet(name: "Saturn", imageName: "saturn", diameter: 120536, dayLength: 10.7, millionKMsFromSun: 1433.5)
    
    let uranus = Planet(name: "Uranus", imageName: "uranus", diameter: 51118, dayLength: 17.2, millionKMsFromSun: 2872.5)
    
    let neptune = Planet(name: "Neptune", imageName: "neptune", diameter: 49528, dayLength: 16.1, millionKMsFromSun: 4495.1)
    
    let pluto = Planet(name: "Pluto", imageName: "pluto", diameter: 2370, dayLength: 153.3, millionKMsFromSun: 5906.4)
    
    return [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]
  }

  
}
