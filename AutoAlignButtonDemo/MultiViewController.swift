//
//  MultiViewController.swift
//  AutoAlignButtonDemo
//
//  Created by WhatsXie on 2017/10/9.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class MultiViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var listTableView:UITableView?
    
    var dataArray:Array<Any>{
        return ["人参","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖","鳖","白吃丸吃丸","欧赔","龟苓膏","华佗金散","鹤顶红","华佗金散","鹤顶红","人参","鳖"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style: .plain)
        
        listTableView?.dataSource = self
        listTableView?.delegate = self
        listTableView?.register(TagCell.self, forCellReuseIdentifier: String(describing: TagCell.self))
        view.addSubview(listTableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension MultiViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: String(describing: TagCell.self)) as! TagCell
        cell.setTextArray(textArray: self.dataArray as NSArray, row: indexPath.section)
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.dataArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TagCell.cellHeight(textArray: self.dataArray as NSArray, row: indexPath.section)
    }
}
