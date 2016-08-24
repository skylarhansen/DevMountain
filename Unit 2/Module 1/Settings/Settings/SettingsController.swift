//
//  SettingsController.swift
//  Settings
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class SettingsController {
  
  static let sharedController = SettingsController()
  
  var settings: [Setting] = []
  
  init() {
    settings = mockSettings()
  }
  
  func mockSettings() -> [Setting] {
    
    let music = Setting(name: "Music", image: UIImage(named: "music"))
    let books = Setting(name: "Books", image: UIImage(named: "books"))
    let apps = Setting(name: "Apps", image: UIImage(named: "apps" ))
    
    return [music, books, apps]
    
  }
  
  func settingChanged(setting: Setting, selected: Bool) {
    setting.isSet = selected
  }
  
}
