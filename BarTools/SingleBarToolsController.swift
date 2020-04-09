//
//  BarTools
//
//  Created by Tim on 2020/4/8.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class SingleBarToolsController: UIViewController {

    lazy var barTools: BarToolsView = {
        let barTools = BarToolsView()
        barTools.delegate = self
        barTools.bordersColor = UIColor.brown
        barTools.textColor = UIColor.brown
        barTools.font = UIFont.systemFont(ofSize: 13)
        return barTools
    }()

    var itemsArray: [String] = [String]() {
        didSet {
            barTools.itemsArray = itemsArray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsArray = ["你好", "Hello", "안녕하세요", "Bonjour", "Hallo", "Привет", "こんにちは", "hej", "tere"]

        setupUI()
    }
    
    func setupUI() {
        view.addSubview(barTools)
        barTools.frame = CGRect(x: 0, y: view.frame.size.height - 59, width: view.frame.size.width, height: 39)
    }

    @IBAction func updateAction(_ sender: Any) {
        itemsArray = ["ahoj", "Ciao", "hei", "สวัสดี"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SingleBarToolsController: BarToolsViewDelegate {
    func barToolsClicked(index: Int) {
        print("current content:\(itemsArray[index])")
    }
}
