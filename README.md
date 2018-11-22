# LineTagView

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Swift-orange.svg) ![](https://img.shields.io/badge/download-9.9MB-yellow.svg) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)

## 🎨 测试 UI 什么样子？

| 展示列表 | 自动排版 | 更新自动排版 | 复选排版 |
| ------------- | ------------- | ------------- | ------------- |
| ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/24261964.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/90582443.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/70739061.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/95526263.jpg) |


## 🛠 使用

### 1.简单的单行单选使用
```swift
/// 声明控件
    lazy var autoBtn:AutoAlignView = {
        let btn = AutoAlignView()
        btn.delegate = self
        btn.bordersColor = UIColor.brown
        btn.textColor = UIColor.brown
        btn.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
/// 数据源
    var listArray = NSMutableArray() {
        didSet{
            autoBtn.itemsArray = listArray
        }
    }
```

放置控件

```swift
    func setupAutoButton() {
        self.view.addSubview(autoBtn)
        // Snapkit ..
        autoBtn.frame = CGRect(x:0, y:view.frame.size.height - 59, width:view.frame.size.width, height:39)
    }
```

加载及更新数据

```swift
   listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
```

### 2.简单的多行多选使用
```swift
    var dataArray:Array<Any>{
        return ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
    }
```

tableView 的 Cell 实现

```swift
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: String(describing: MultipleCell.self)) as! MultipleCell
        cell.setTextArray(textArray: self.dataArray as NSArray, row: indexPath.section)
        return cell;
    }
```

> 随意整理一下，结构不是很好，仅供参考吧~

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
