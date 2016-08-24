//
//  BackgroundChangeViewController.swift
//  ViewsAndStoryboards
//
//  Created by Spencer Curtis on 8/15/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import UIKit

class BackgroundChangeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundButtonTapped(sender: AnyObject) {
        
        self.view.backgroundColor = UIColor.blue
        
    }
    
    @IBAction func backgroundButtonTapped2(sender: AnyObject) {
        self.view.backgroundColor = UIColor.brown
    }

    
}
