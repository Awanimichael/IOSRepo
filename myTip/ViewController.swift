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
    
    var isGrey = false
    var tipPercentages = [0.15,0.18,0.2]
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let bill = "bill"
        static let selectedTip = "selectedTip"
        static let savedDate = "savedDate"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        styleBillFiled()
        billField.becomeFirstResponder()
        checkSavedBill()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill Amount
        let bill = Double(billField.text!) ?? 0
        saveBill()

        //Calculate tip and total
        let tip   = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip and total labels
        tipLabel.text   = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Retrieve the default tip percentage from UserDefaults
        retriveStoredTip()
        calculateTip(tipControl.selectedSegmentIndex)
        changeView.center.x  -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [],
            animations: {
                self.changeView.center.x += self.view.bounds.width
                self.changeView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            },
            completion: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func styleBillFiled() {
        billField.borderStyle = UITextField.BorderStyle.none;
    }
    
    func saveBill() {
        defaults.set(billField.text!, forKey: Keys.bill)
    }

    func checkSavedBill() {
        let newBill = defaults.double(forKey: Keys.bill )
        if newBill > 0 {
            billField.text = String(newBill)
        }
    }
    
    func retriveStoredTip() {
        let selectedTip = defaults.double(forKey: Keys.selectedTip)
        tipControl.selectedSegmentIndex = tipPercentages.firstIndex(of: selectedTip) ?? 0
    }
 
}

