//
//  ViewController.swift
//  myTip
//
//  Created by Rotimi Awani on 9/16/19.
//  Copyright © 2019 Rotimi Awani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var changeView: UIView!
    
    var tipPercentages = [0.15,0.18,0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.borderStyle = UITextField.BorderStyle.none;
        self.title = "Tip Calculator"
        billField.becomeFirstResponder()
        //retrive bill field
        let defaults2 = UserDefaults.standard
        let newBill = defaults2.double(forKey: "bill")
        if newBill > 0 {
            billField.text = String(newBill)
        }
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill Amount
        let bill = Double(billField.text!) ?? 0
        
        //Save bill
        let defaults2 = UserDefaults.standard
        defaults2.set(bill, forKey: "bill")
        
        //Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This is a good place to retrieve the default tip percentage from UserDefaults
        let defaults = UserDefaults.standard
        let selectedTip = defaults.double(forKey: "selectedTip")
        
        // and use it to update the tip amount
        // find the index of the saved tip in array
        tipControl.selectedSegmentIndex = tipPercentages.firstIndex(of: selectedTip) ?? 0
        
        calculateTip(tipControl.selectedSegmentIndex)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
}

