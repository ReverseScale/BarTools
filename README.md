# LineTagView

  viewController 调用方法：
  
  ```swift
var autoButton = LineTagView()
let listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]

autoButton = LineTagView(frame: CGRect(x:0,y:400, width:self.view.frame.size.width, height:39))
autoButton.delegate = self
autoButton.borderColor = UIColor.brown
autoButton.textColor = UIColor.brown
autoButton.font = UIFont.systemFont(ofSize: 13)
autoButton.itemsArray = listArray as! NSMutableArray
self.view.addSubview(autoButton)

autoButton.reloadData()
  ```
  
  Delegate  && 更新方法：
  
  ```swift
extension ViewController:LineTagViewDelegate {
    func BtnClickIndex(index: Int) {
//        myView = LineTagView(frame: CGRect(x:0,y:400, width:self.view.frame.size.width / 2, height:42))
//        myView.itemsArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
//        myView.reloadData()
        print("isSelected:\(listArray[index])")
        
    }
}
  ```
  
  效果截图：（自适应）
  
  ![](http://og1yl0w9z.bkt.clouddn.com/public/16-12-6/60535316.jpg)
