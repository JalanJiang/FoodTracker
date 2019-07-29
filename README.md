# Start Developing iOS Apps(Swift)

iOS 官方教程：[Start Developing iOS Apps (Swift)](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/)。

## 知识点

- [x] 认识 Xcode
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
- [ ] 实现自定义控件
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
- [ ] 定义数据模型

## 一些零散的语法

- 已知枚举类型的缩写
- [Swift教程 - Swift范围操作符](https://www.w3cschool.cn/swift/swift-range-operators.html)

## 踩坑

- [How do I use the updated UIImagePickerControllerDelegate iOS 12 API?](https://stackoverflow.com/questions/51182701/how-do-i-use-the-updated-uiimagepickercontrollerdelegate-ios-12-api)
- 点击手势无反应：[GestureRecognizer not responding to tap](https://stackoverflow.com/questions/26028455/gesturerecognizer-not-responding-to-tap)
- 使用 `#selector` 报错：['#selector' refers to a method that is not exposed to Objective-C](https://stackoverflow.com/questions/36818083/selector-refers-to-a-method-that-is-not-exposed-to-objective-c)
- [It’s time to stop using index(of:)](https://www.hackingwithswift.com/articles/177/its-time-to-stop-using-index-of)
