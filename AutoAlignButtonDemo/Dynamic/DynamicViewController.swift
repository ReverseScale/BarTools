//
//  ViewController.swift
//  AutoAutoAlignButtonSwift
//
//  Created by WhatsXie on 2017/9/19.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class DynamicViewController: UIViewController {
    var listArray = NSMutableArray() {
        didSet{
            autoBtn.itemsArray = listArray
        }
    }
    
    lazy var autoBtn:AutoAlignView = {
        let btn = AutoAlignView()
        btn.delegate = self
        btn.bordersColor = UIColor.brown
        btn.textColor = UIColor.brown
        btn.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
        setupAutoButton()
    }
    
    func setupAutoButton() {
        self.view.addSubview(autoBtn)
        autoBtn.frame = CGRect(x:0, y:view.frame.size.height - 59, width:view.frame.size.width, height:39)
    }

    @IBAction func showClick(_ sender: Any) {
        listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DynamicViewController:LineTagViewDelegate {
    func BtnClickIndex(index: Int) {
        print("isSelected:\(listArray[index])")
    }
}

