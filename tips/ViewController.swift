//
//  ViewController.swift
//  tips
//
//  Created by Nathan Rapheld on 2/1/15.
//  Copyright (c) 2015 Nathan Rapheld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var basePercentage = 0.18
    var delta = 0.0
    

    @IBOutlet weak var tipdownButton: UIButton!
    @IBOutlet weak var tipupButton: UIButton!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        percentageLabel.text = "18%"
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipDown(sender: AnyObject) {
        delta -= 0.01
        updateTotal()
    }
    
    @IBAction func tipUp(sender: AnyObject) {
        delta += 0.01
        updateTotal()
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        updateTotal()
    }
    
    func updateTotal() {
        var tipPercentage = basePercentage + delta
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        percentageLabel.text = String(format: "%.0f%%", tipPercentage * 100)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", (total))
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

