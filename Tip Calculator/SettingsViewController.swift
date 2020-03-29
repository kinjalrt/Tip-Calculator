//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Kinjal Reetoo on 3/28/20.
//  Copyright © 2020 Kinjal Reetoo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "defaultTip"))
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        let d = UserDefaults.standard
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "defaultTip"))
        
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
