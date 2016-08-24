//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
  
  var setting: Setting?
  weak var delegate: SettingCellDelegate?

  @IBOutlet weak var settingImageView: UIImageView!
  @IBOutlet weak var settingLabel: UILabel!
  @IBOutlet weak var settingSwitch: UISwitch!
  
  func updateCellWithSettings(setting: Setting) {
    self.setting = setting
    settingImageView.image = setting.image
    settingLabel.text = setting.name
    settingSwitch.on = setting.isSet
    
    if setting.isSet {
      backgroundColor = .cyanColor()
    } else {
      backgroundColor = .whiteColor()
    }
    
  }
  
  // MARK: Actions
  
  @IBAction func switchValueChanged(sender: AnyObject) {
    delegate?.settingSwitchValueChanged(self, selected: settingSwitch.on)
  }
  
}

protocol SettingCellDelegate: class {
  
  func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool)
  
}
