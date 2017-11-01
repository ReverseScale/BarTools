//
//  ViewController.swift
//  AutoAutoAlignButtonSwift
//
//  Created by WhatsXie on 2017/9/19.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var autoButton = AutoAlignButton()
    var listArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
        
        autoButton.frame = CGRect(x:0,y:400, width:self.view.frame.size.width, height:39)
        autoButton.delegate = self
        autoButton.bordersColor = UIColor.brown
        autoButton.textColor = UIColor.brown
        autoButton.font = UIFont.systemFont(ofSize: 13)
        autoButton.itemsArray = listArray
        self.view.addSubview(autoButton)
    }

    @IBAction func showClick(_ sender: Any) {
        listArray = ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏"]
        autoButton.itemsArray = listArray

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:LineTagViewDelegate {
    func BtnClickIndex(index: Int) {
        print("isSelected:\(listArray[index])")
    }
}

