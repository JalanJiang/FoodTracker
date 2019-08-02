# Start Developing iOS Apps(Swift)

iOS 官方教程：[Start Developing iOS Apps (Swift)](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/)。

## 知识点

### Getting Started

- [x] 认识 Xcode

### Building the UI

- [x] 构建 UI
    - [x] StoryBoard
    - [x] Auto Layout
- [x] UI 与代码关联
    - [x] 添加 outlets
    - [x] 添加 action
    - [x] 委托：[Swift - 委托（delegate）的介绍，及使用样例](http://www.hangge.com/blog/cache/detail_810.html)
- [x] ViewController
    - 调用 `UIViewController` 方法的流程：
        1. `viewDidLoad()`
        2. `viewWillAppear()`
        3. `viewDidAppear()`
        4. `viewWillDisappear()`
        5. `viewDidDisappear()`
    - 添加图像
    - 添加手势识别
    - 属性列表 info.plist
        - 提供照片库使用说明
- [x] 实现自定义控件
    - [x] 创建自定义视图
        - 初始化视图：以编程方式 & 以 storyboard 方式
        - 显示视图：配置 Identity inspector -> Class
        - 向视图添加按钮：创建按钮、修改按钮属性、为按钮添加 Action、添加按钮到视图
    - [x] 添加对 Interface Builder 的支持
        - 在检查器中访问自定义属性值：[IBInspectable / IBDesignable](https://nshipster.cn/ibinspectable-ibdesignable/)
        - 属性观察者（触发器）：[属性观察](https://swifter.tips/property-observer/)
    - [x] 在 Button 上添加星星按钮
    - [x] 实现 Button Action
        - 变更按钮的状态
    - [x] 添加辅助功能信息（无障碍使用）：[带你认识——iOS Accessibility](https://www.jianshu.com/p/0991a4f0bc0c)
    - [x] 将 `rating` 连接到视图控制器 vieController.swift 中
    - [x] 整理界面：删除设置默认文本按钮、Stack 元素居中处理
- [ ] 定义数据模型
    - [x] 创建数据模型
    - [ ] 测试数据
    
### Working with Table Views

- [x] 创建 Table View
    - [x] Table View Controller 拖入 StoryBoard
    - [x] 设计表格 Cell
    - [x] Cell 与 代码关联
    - [x] 加载初始数据
        - 创建 MealTableViewController.swift
    - [x] 显示数据
        - `func numberOfSections(in tableView: UITableView) -> Int`
        - `func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int`
        - `func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`
- [ ] 实现导航
    - [x] 添加 Segue - Editor > Embed In > Navigation Controller
    - [x] 配置导航
        - Bar Button Item object - 通过拖拽可完成场景切换
        - 修改 Segue：修改动画 & 填写 Identifier
        - 添加 Cancel / Save / Add Button


## 一些零散的语法

- 已知枚举类型的缩写
- [Swift教程 - Swift范围操作符](https://www.w3cschool.cn/swift/swift-range-operators.html)
- [Failable Initializers](https://developer.apple.com/swift/blog/?id=17)
- [使用 guard 的正确姿势](https://swift.gg/2016/02/14/swift-guard-radix/)

## 踩坑

- [How do I use the updated UIImagePickerControllerDelegate iOS 12 API?](https://stackoverflow.com/questions/51182701/how-do-i-use-the-updated-uiimagepickercontrollerdelegate-ios-12-api)
- 点击手势无反应：[GestureRecognizer not responding to tap](https://stackoverflow.com/questions/26028455/gesturerecognizer-not-responding-to-tap)
- 使用 `#selector` 报错：['#selector' refers to a method that is not exposed to Objective-C](https://stackoverflow.com/questions/36818083/selector-refers-to-a-method-that-is-not-exposed-to-objective-c)
- [It’s time to stop using index(of:)](https://www.hackingwithswift.com/articles/177/its-time-to-stop-using-index-of)
- [Why would you use `init!` instead of `init?` when implementing a Failable Initializer in Swift?](https://stackoverflow.com/questions/31598425/why-would-you-use-init-instead-of-init-when-implementing-a-failable-initia)
