//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jalan_Jiang on 2019/7/23.
//  Copyright © 2019 Jalan_Jiang. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    // @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any ad=ditional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        
        // 将自身设置为 nameTextField 属性的委托
        nameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 开始编辑前
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 编辑完成后
        updateSaveButtonState() // 更新按钮状态
        navigationItem.title = textField.text
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
    
    //MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name, photo: photo, rating: rating)
    }
    
    // cancel 按钮
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // 丢弃当前场景并转回上一个场景
        dismiss(animated: true, completion: nil)
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
    
    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

