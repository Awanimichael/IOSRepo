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
    
    let tipPercentages = [0.15, 0.18, 0.20]
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let selectedTip = "selectedTip"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveStoredTip()
    }
    
    @IBAction func storeTip(_ sender: Any) {
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        defaults.set(tipPercent, forKey: Keys.selectedTip)
    }
    
    func retriveStoredTip() {
        let selectedTip = defaults.double(forKey: Keys.selectedTip)
        tipControl.selectedSegmentIndex = tipPercentages.firstIndex(of: selectedTip) ?? 0
    }
    
}
