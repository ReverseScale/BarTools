# LineTagView

  viewController 调用方法：
  
  ```swift
     myView = LineTagView(frame: CGRectMake(0,100, self.view.frame.size.width, 39))
     myView?.delegate = self
     myView?.borderColor = UIColor.brownColor()
     myView?.textColor = UIColor.brownColor()
     myView?.font = UIFont.systemFontOfSize(13)
     myView?.itemsArray = ["龟苓膏","华佗金散","鹤顶红","人参","鳖","白吃丸吃丸"]
     self.view.addSubview(myView!)
     myView?.reloadData()
  ```
  
  Delegate  && 更新方法：
  
  ```swift
    extension ImagesBrowseViewController:LineTagViewDelegate {
    func BtnClickIndex(index: Int) {
        print("Index-----:\(index)")
        myView?.frame = CGRectMake(0,100, self.view.frame.size.width / 2, 42)
        myView?.itemsArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
        myView?.reloadData()
    }
}
  ```
  
  效果截图：（自适应）
  
  ![](http://og1yl0w9z.bkt.clouddn.com/public/16-12-6/60535316.jpg)
