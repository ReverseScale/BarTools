//
//  BarTools
//
//  Created by Tim on 2020/4/8.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class MultiSelectBarToolsController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MultipleCell.self, forCellReuseIdentifier: String(describing: MultipleCell.self))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var dataArray: [String] {
        return ["你好", "Hello", "안녕하세요", "Bonjour", "Hallo", "Привет", "こんにちは", "hej", "tere", "ahoj", "Ciao", "hei", "สวัสดี"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MultiSelectBarToolsController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: String(describing: MultipleCell.self)) as! MultipleCell
        cell.setTextArray(textArray: self.dataArray as NSArray, row: indexPath.section)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MultipleCell.cellHeight(textArray: self.dataArray as NSArray, row: indexPath.section)
    }
}
