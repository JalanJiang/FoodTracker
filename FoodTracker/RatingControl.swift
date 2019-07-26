//
//  RatingControl.swift
//  FoodTracker
//
//  Created by JalanJiang on 2019/7/26.
//  Copyright © 2019 Jalan_Jiang. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingButtons = [UIButton]() // 按钮列表
    var rating = 0 // 评级
    
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
    private func setupButtons() {
        
        // 循环创建 5 个按钮
        for _ in 0..<5 {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false // 禁用按钮自动生成的约束
            // isActive 用于启用或停用约束
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true // 高度约束
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true // 宽度约束
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button) // 将按钮添加到管理的视图列表中
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
}
