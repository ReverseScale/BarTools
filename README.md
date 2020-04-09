# LineTagView

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Swift-orange.svg) ![](https://img.shields.io/badge/download-9.9MB-yellow.svg) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)

## 🎨 测试 UI 什么样子？

| 展示列表 | 自动排版 | 更新自动排版 | 复选排版 |
| ------------- | ------------- | ------------- | ------------- |
| ![](https://s1.ax1x.com/2020/04/09/G4UcPx.png) | ![](https://s1.ax1x.com/2020/04/09/G4UU2T.png) | ![](https://s1.ax1x.com/2020/04/09/G4U0r4.png) | ![](https://s1.ax1x.com/2020/04/09/G4UrZ9.png) |

## 🛠 使用

### 简单的单行单选使用
```swift
/// 声明控件
    lazy var barTools: BarToolsView = {
        let barTools = BarToolsView()
        barTools.delegate = self
        barTools.bordersColor = UIColor.brown
        barTools.textColor = UIColor.brown
        barTools.font = UIFont.systemFont(ofSize: 13)
        return barTools
    }()
/// 数据源
    itemsArray = ["你好", "Hello", "안녕하세요", "Bonjour", "Hallo", "Привет", "こんにちは", "hej", "tere"]
```

加载及更新数据响应

```swift
   var itemsArray: [String] = [String]() {
        didSet {
            barTools.itemsArray = itemsArray
        }
    }
```

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
