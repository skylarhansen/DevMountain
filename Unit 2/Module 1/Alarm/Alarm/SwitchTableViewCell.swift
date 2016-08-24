//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var alarmSwitch: UISwitch!
  
  weak var delegate: SwitchTableViewCellDelegate?
  
  @IBAction func switchValueChanged(sender: AnyObject) {
    delegate?.switchCellSwitchValueChanged(self)
  }
  
  func updateWithAlarm(alarm: Alarm) {
    timeLabel.text = alarm.timeAsString()
    nameLabel.text = alarm.name
    alarmSwitch.on = alarm.enabled
  }

}

protocol SwitchTableViewCellDelegate: class {
  func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}
