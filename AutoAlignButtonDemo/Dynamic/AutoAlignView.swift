//
//  AutoAlignButton.swift
//  AutoAutoAlignButtonSwift
//
//  Created by StevenXie on 16/8/18.
//  Copyright © 2016年 Stephen. All rights reserved.
//

import UIKit

protocol LineTagViewDelegate:NSObjectProtocol {
    func BtnClickIndex(index:Int)
}

class AutoAlignView: UIView {
    weak var delegate:LineTagViewDelegate?
    var textColor:UIColor = UIColor.black
    var bordersColor:UIColor = UIColor.black
    var font:UIFont = UIFont.systemFont(ofSize: 13.0)
    
    var widthOfButtonArray:NSMutableArray = [0]
    var scrollView = UIScrollView()
    var buttonOfX:CGFloat = 0
    var allWidth:CGFloat = 0
    var all:CGFloat = 0
    var str: String = ""
    var itemsArray:NSMutableArray = []{
        didSet{
            removeView()
            setupButton()
        }
    }
    var btn: UIButton?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupScrollView()
    }
    func setupScrollView() {
        scrollView.backgroundColor = UIColor.white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        self.addSubview(scrollView)
    }
    private func setupViews() {
        self.layoutSubviews()
    }
    
    func setupButton() {
        for i in 0..<itemsArray.count {
            btn = UIButton(type: .custom)
            btn?.titleLabel!.font = font
            btn?.layer.masksToBounds = true
            btn?.layer.borderWidth = 1
            btn?.layer.borderColor = bordersColor.cgColor
            btn?.layer.cornerRadius = 3
            btn?.tag = 100 + i
            btn?.addTarget(self, action: #selector(self.handleClick), for: .touchUpInside)
            btn?.setTitleColor(textColor, for: .normal)
            
            str = itemsArray[i] as! String
            btn?.setTitle(str, for: .normal)
            var titleSize: CGSize = str.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: UIFont(name: btn!.titleLabel!.font.fontName, size: btn!.titleLabel!.font.pointSize)!])
            titleSize.height += 15
            titleSize.width += 20
            widthOfButtonArray[i + 1] = titleSize.width
            buttonOfX = 3 + CGFloat(widthOfButtonArray[i] as! NSNumber) + buttonOfX
            btn?.frame = CGRect(x:buttonOfX, y:4, width:titleSize.width, height:titleSize.height)
            
            all = 0
            all = buttonOfX + titleSize.width + 3
            scrollView.addSubview(btn!)
        }
        scrollView.contentSize = CGSize(width:all, height:30)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:self.frame.size.height)
    }
    
    func removeView() {
        widthOfButtonArray = [0]
        buttonOfX = 0
        allWidth = 0
        all = 0
        
        scrollView.removeAllSubViews()
        scrollView.contentSize = CGSize(width:0, height:30)
    }
    
    @objc func handleClick(btn: UIButton) {
        let index = btn.tag - 100
        delegate?.BtnClickIndex(index: index)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func removeAllSubViews() {
        subviews.forEach {$0.removeFromSuperview()}
    }
}
