//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kinjal Reetoo on 3/26/20.
//  Copyright © 2020 Kinjal Reetoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "defaultTip"))
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        // Do any additional setup after loading the view.
    }
    
    func cal(){
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()

        print("view will appear")
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "defaultTip"))
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        cal()
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        cal()
    }
}

