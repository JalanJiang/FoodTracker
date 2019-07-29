//
//  RatingControl.swift
//  FoodTracker
//
//  Created by JalanJiang on 2019/7/26.
//  Copyright © 2019 Jalan_Jiang. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: Properties
    // 按钮列表
    private var ratingButtons = [UIButton]()
    // 评级
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            // 当属性值重新被设置时创建按钮
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            // 当属性值重新被设置时创建按钮
            setupButtons()
        }
    }
    
    // MARK: Initialization
    // 初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Private Methods
    // 创建按钮
    private func setupButtons() {
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightStar", in: bundle, compatibleWith: self.traitCollection)
        
        // 循环创建 5 个按钮
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            // button.backgroundColor = UIColor.red
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false // 禁用按钮自动生成的约束
            // isActive 用于启用或停用约束
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true // 高度约束
            button.widthAnchor.constraint(equalToConstant: starSize.height).isActive = true // 宽度约束
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button) // 将按钮添加到管理的视图列表中
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        // 添加按钮后根据评分更新按钮状态
        updateButtonSelectionStates()
        
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        // print("Button pressed 👍")
        
        // 获取按钮下标
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    // 更新按钮状态
    @objc func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
