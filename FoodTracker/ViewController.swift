//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jalan_Jiang on 2019/7/23.
//  Copyright © 2019 Jalan_Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any ad=ditional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        
        // 将自身设置为 nameTextField 属性的委托
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    // MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameTextField.text = "Default Text"
    }
}

