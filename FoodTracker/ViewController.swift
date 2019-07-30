//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jalan_Jiang on 2019/7/23.
//  Copyright © 2019 Jalan_Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
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
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    // MARK: Actions
    
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        nameTextField.text = "Default Text"
//    }
    
    // 手势识别的单点操作触发
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
            // This code ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
            // Hide the keyboard.
            nameTextField.resignFirstResponder()
            
            // UIImagePickerController is a view controller that lets a user pick media from their photo library.
            let imagePickerController = UIImagePickerController()
            
            // Only allow photos to be picked, not taken.
            imagePickerController.sourceType = .photoLibrary // 已知枚举类型的缩写
            
            // Make sure ViewController is notified when the user picks an image.
            imagePickerController.delegate = self // 委托
            present(imagePickerController, animated: true, completion: nil)
    }
}

