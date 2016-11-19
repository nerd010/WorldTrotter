//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Richard Wang on 2016/11/14.
//  Copyright © 2016年 Richard Wang. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController load its view")
    }
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
//            celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber.init(value: value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
//        if let text = textField.text , !text.isEmpty {
//            celsiusLabel.text = text
//        } else {
//            celsiusLabel.text = "???"
//        }
//        if let text = textField.text, let value = Double(text) {
//            fahrenheitValue = value
//        } else {
//            fahrenheitValue = nil
//        }
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = number.doubleValue
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyBoard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("current text: \(textField.text)")
//        print("replacement text: \(string)")
//        return true
        
//        let cs = NSCharacterSet.init(charactersIn: "0123456789.").inverted
//        let filtered = textField.text?.components(separatedBy: cs).joined(separator: " ")
//        
//        if (!(string == filtered)) {
//            let alert = UIAlertController.init(title: "提示", message: "请输入数字", preferredStyle: .alert)
//            let cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: { (UIAlertAction) in
//                
//            })
//            let confirm = UIAlertAction.init(title: "确定", style: .default, handler: { (UIAlertAction) in
//                
//            })
//            alert.addAction(cancel)
//            alert.addAction(confirm)
//            self.present(alert, animated: true, completion: {
//                
//            })
//            return false
//        }
//        return true
        
        let currentLocale = NSLocale.current
        let decimalSeparator = currentLocale.decimalSeparator
        let existingTextHasDecimalSepatator = textField.text?.range(of: decimalSeparator!)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator!)
        
//        let existingTextHasDecimalSepatator = textField.text?.range(of: ".")
//        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSepatator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
