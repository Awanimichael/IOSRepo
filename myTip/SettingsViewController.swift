//
//  SettingsViewController.swift
//  myTip
//
//  Created by Rotimi Awani on 9/23/19.
//  Copyright © 2019 Rotimi Awani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func storeTip(_ sender: Any) {
        
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Set the value
        defaults.set(tipPercent, forKey: "selectedTip")
        
        // Force UserDefaults to save.
        // defaults.synchronize()
    }
    

}
