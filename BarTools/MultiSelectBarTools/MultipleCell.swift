//
//  BarTools
//
//  Created by Tim on 2020/4/8.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class MultipleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var itemView: MultipleItemView!
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle  = .none
        self.itemView = MultipleItemView.init(totalTagNum: 30,
                                              viewWidth: UIScreen.main.bounds.size.width - 20,
                                              eachNum: 0,
                                              hmargin: 10,
                                              vmargin: 10,
                                              tagheight: 30,
                                              tagTextFont: UIFont.systemFont(ofSize: 14),
                                              tagTextColor: UIColor.brown,
                                              selectedTagTextColor: UIColor.white,
                                              selectedBackgroundColor: UIColor.brown)
        self.itemView?.maxSelectNum = 10
        self.contentView.addSubview(self.itemView)
        self.itemView .selectBlockAction { (array) in
            print("选中数组更新：\(array)")
        }
        
        self.itemView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint.init(item: self.itemView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10)
        let left = NSLayoutConstraint.init(item: self.itemView, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 10)
        let bottom = NSLayoutConstraint.init(item: self.itemView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10)
        let right = NSLayoutConstraint.init(item: self.itemView, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -10)
        self.contentView .addConstraints([top,left,bottom,right])
    }
    
    public func setTextArray(textArray:NSArray, row:NSInteger) {
        if row % 2 == 0 {
            self.itemView.eachNum = 0
        } else {
            self.itemView.eachNum = 3
        }
        self.itemView.setTagTexts(tagTexts: textArray as! Array<String>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func cellHeight(textArray:NSArray, row:NSInteger) -> CGFloat{
        var height:CGFloat = 0.0
        var eachNum:NSInteger
        if row % 2 == 0 {
            eachNum = 0
        } else {
            eachNum = 3
        }
        
        height = MultipleItemView.returnViewHeight(tagTexts: textArray as! Array<Any>, viewWidth: UIScreen.main.bounds.size.width - 20, eachNum: eachNum, hmargin: 10, vmargin: 10, tagHeight: 30, tagTextFont: UIFont.systemFont(ofSize: 14))
        return height + 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
