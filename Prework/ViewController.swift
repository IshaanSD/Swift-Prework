//
//  ViewController.swift
//  Prework
//
//  Created by Ishaan Gupta on 2/4/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!

    @IBOutlet weak var tipAmountLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    
    @IBOutlet weak var billStepper: UIStepper!
    
    @IBOutlet weak var tipSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTipTotal(){
        let tipFraction = Float(tipSlider.value)
  
        let bill = Float(billAmountTextField.text!) ?? 0

        let tip = bill*tipFraction
        let total = bill + tip
        tipAmountLabel.text = String( format:"$%.2f", tip)
        totalLabel.text = String( format:"$%.2f", total)
    }
    
    @IBAction func enterBill(_ sender: Any) {
        updateTipTotal()
    }
    @IBAction func adjustSlider(_ sender: Any) {
        
        let tipPtg = Float(tipPercentageField.text!) ?? 0
        tipSlider.setValue(tipPtg/100, animated: true)
        
        updateTipTotal()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipFraction = Float(tipSlider.value)
        tipPercentageField.text = String(format:"%.2f",tipFraction*100)
        updateTipTotal()
    }
    
    @IBAction func stepBill(_ sender: UIStepper) {
        let bill = Double(billAmountTextField.text!) ?? 0
        billAmountTextField.text =  String(bill + sender.value)
        updateTipTotal()
    }
}

