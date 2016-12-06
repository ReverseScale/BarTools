//
//  LineTagView.swift
//  BrgHdr
//
//  Created by StevenXie on 16/8/18.
//  Copyright © 2016年 Stephen. All rights reserved.
//

import UIKit

protocol LineTagViewDelegate:NSObjectProtocol {
    func BtnClickIndex(index:Int)
}

class LineTagView: UIView {
    weak var delegate:LineTagViewDelegate?
    var textColor:UIColor = UIColor.blackColor()
    var borderColor:UIColor = UIColor.blackColor()
    var font:UIFont = UIFont.systemFontOfSize(13.0)
    
    var widthOfButtonArray:NSMutableArray = [0]
    var scrollView = UIScrollView()
    var buttonOfX:CGFloat = 0
    var allWidth:CGFloat = 0
    var all:CGFloat = 0
    var str: String = ""
    var itemsArray:NSMutableArray = []
    var btn: UIButton?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.setupScrollView()
    }
    func setupScrollView() {
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        self.addSubview(scrollView)
    }
    private func setupViews() {
        
        self.setupButton()
        
        self.layoutSubviews()
    }
    
    func setupButton() {
        for i in 0..<itemsArray.count {
            btn = UIButton(type: .Custom)
            btn?.titleLabel!.font = font
            btn?.layer.masksToBounds = true
            btn?.layer.borderWidth = 1
            btn?.layer.borderColor = borderColor.CGColor
            btn?.layer.cornerRadius = 3
            btn?.tag = 100 + i
            btn?.addTarget(self, action: #selector(self.handleClick), forControlEvents: .TouchUpInside)
            btn?.setTitleColor(textColor, forState: .Normal)
            
            str = itemsArray[i] as! String
            btn?.setTitle(str, forState: .Normal)
            var titleSize: CGSize = str.sizeWithAttributes([NSFontAttributeName: UIFont(name: btn!.titleLabel!.font.fontName, size: btn!.titleLabel!.font.pointSize)!])
            titleSize.height += 15
            titleSize.width += 20
            widthOfButtonArray[i + 1] = titleSize.width
            buttonOfX = 3 + CGFloat(widthOfButtonArray[i] as! NSNumber) + buttonOfX
            btn?.frame = CGRectMake(buttonOfX, 4, titleSize.width, titleSize.height)
            
            all = 0
            all = buttonOfX + titleSize.width + 3
            scrollView.addSubview(btn!)
        }

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        scrollView.contentSize=CGSizeMake(all, 30)

    }
    
    func removeView() {
        widthOfButtonArray = [0]
        buttonOfX = 0
        allWidth = 0
        all = 0
        
        if itemsArray.count != 0 {
            for i in 0..<itemsArray.count {
                (self.viewWithTag(i + 100) as? UIButton)?.removeFromSuperview()
            }
        }
    }
    
    func reloadData() {
        self.removeView()
        
        self.setupViews()
    }
    
    
    func handleClick(btn: UIButton) {
        let index = btn.tag - 100
        delegate?.BtnClickIndex(index)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

