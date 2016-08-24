//
//  SettingsViewController.swift
//  Settings
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var settingsTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SettingsController.sharedController.settings.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = settingsTableView.dequeueReusableCellWithIdentifier("settingCell", forIndexPath: indexPath) as? SettingTableViewCell
    
    let setting = SettingsController.sharedController.settings[indexPath.row]
    
    // update cell setting
    cell?.updateCellWithSettings(setting)
    cell?.delegate = self
    
    return cell ?? SettingTableViewCell()
  
  }
}

extension SettingsViewController: SettingCellDelegate {
  
  func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool) {
    guard let setting = cell.setting, let indexPath = settingsTableView.indexPathForCell(cell) else { return }
    
    SettingsController.sharedController.settingChanged(setting, selected: selected)
    settingsTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
  }
  
}
