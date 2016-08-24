//
//  ProjectTableViewCell.swift
//  Task
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    // MARK: - Complete Button Drawing Properties
    
    var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete.boolValue)
    }
}

