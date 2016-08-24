//
//  Setting.swift
//  Settings
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class Setting {
  
  var isSet: Bool
  var name: String
  var image: UIImage?
  
  init(name: String, image: UIImage?, isSet: Bool = false) {
    self.isSet = isSet
    self.name = name
    self.image = image
  }
  
}
