//
//  TagCell.swift
//  AutoAutoAlignButtonSwift
//
//  Created by StevenXie on 16/8/18.
//  Copyright © 2016年 Stephen. All rights reserved.
//

import UIKit
let screenWidth:CGFloat = UIScreen.main.bounds.size.width
let screenheight:CGFloat = UIScreen.main.bounds.size.height

class TagCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var tagView:MultiButtonTagView!
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle  = .none
        self.tagView = MultiButtonTagView.init(totalTagNum: 30, viewWidth: screenWidth-20, eachNum: 0, hmargin: 10, vmargin: 10, tagheight: 30, tagTextFont: UIFont.systemFont(ofSize: 14), tagTextColor: UIColor.red.withAlphaComponent(0.5), selectedTagTextColor: UIColor.white, selectedBackgroundColor: UIColor.red.withAlphaComponent(0.5))
        self.tagView?.maxSelectNum = 10
        self.contentView.addSubview(self.tagView)
        self.tagView .selectBlockAction { (array) in
            print("选中数组更新：\(array)")
        }
        
        self.tagView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint.init(item: self.tagView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10)
        let left = NSLayoutConstraint.init(item: self.tagView, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 10)
        let bottom = NSLayoutConstraint.init(item: self.tagView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10)
        let right = NSLayoutConstraint.init(item: self.tagView, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -10)
        self.contentView .addConstraints([top,left,bottom,right])
    }
    
    public func setTextArray(textArray:NSArray, row:NSInteger) {
        if row%2 == 0 {
            self.tagView.eachNum = 0
        }else{
            self.tagView.eachNum = 3
        }
        self.tagView.setTagTexts(tagTexts: textArray as! Array<String>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellHeight(textArray:NSArray, row:NSInteger) -> CGFloat{
        
        var height:CGFloat = 0.0
        var eachNum:NSInteger
        if row%2 == 0 {
            eachNum = 0
        }else{
            eachNum = 3
        }
        
        height = MultiButtonTagView.returnViewHeight(tagTexts: textArray as! Array<Any>, viewWidth: screenWidth-20, eachNum: eachNum, hmargin: 10, vmargin: 10, tagHeight: 30, tagTextFont: UIFont.systemFont(ofSize: 14))
        
        return height + 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
