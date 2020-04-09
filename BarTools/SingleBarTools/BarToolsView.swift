//
//  BarTools
//
//  Created by Tim on 2020/4/8.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

// MARK: - 工具条 配置文件
struct BarToolsConfig {
    static let buttonTag: Int = 100
    static let buttonOfX: CGFloat = 0
    static let allWidth: CGFloat = 0
    static let allGroup: CGFloat = 0

    static let heigthOffset: CGFloat = 15
    static let widthOffset: CGFloat = 78
}

// MARK: - 工具条 协议
protocol BarToolsViewDelegate:NSObjectProtocol {
    func barToolsClicked(index: Int)
}

// MARK: - 工具条控件
class BarToolsView: UIView {
    weak var delegate: BarToolsViewDelegate?

    public var textColor: UIColor = UIColor.black
    public var bordersColor: UIColor = UIColor.black
    public var font: UIFont = UIFont.systemFont(ofSize: 13.0)
    public var contentSpace: CGFloat = 10
    public var borderWidth: CGFloat = 1
    public var cornerRadius: CGFloat = 3
    public var position: ButtonEdgePosition = .leftImageRightText

    var buttonOfX: CGFloat = BarToolsConfig.buttonOfX
    var allWidth: CGFloat = BarToolsConfig.allWidth
    var allGroup: CGFloat = BarToolsConfig.allGroup
    var widthOfButtonArray: NSMutableArray = [0]
    var itemData: String = ""
    var itemsArray: [Any] = [] {
        didSet {
            removeView()
            setupButton()
        }
    }

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(scrollView)
    }
    
    func setupButton() {
        for index in 0..<itemsArray.count {
            itemData = itemsArray[index] as! String

            let itemButton = getEdgePositionButton()
            itemButton.setImage(UIImage(named: itemData), for: .normal)
            itemButton.imageSize = CGSize(width: 25, height: 15)
            itemButton.tag = BarToolsConfig.buttonTag + index

            var titleSize: CGSize = itemData.size(withAttributes: [
                kCTFontAttributeName as NSAttributedStringKey: UIFont(name: font.fontName,
                                                                      size: font.pointSize)!])
            titleSize.height += BarToolsConfig.heigthOffset
            titleSize.width += BarToolsConfig.widthOffset
            widthOfButtonArray[index + 1] = titleSize.width
            buttonOfX = 3 + CGFloat(truncating: widthOfButtonArray[index] as? NSNumber ?? 0) + buttonOfX
            itemButton.frame = CGRect(x: buttonOfX, y: 4, width: titleSize.width, height: titleSize.height)
            
            allGroup = 0
            allGroup = buttonOfX + titleSize.width + 3
            scrollView.addSubview(itemButton)
        }
        scrollView.contentSize = CGSize(width: allGroup, height: 30)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }

    func getEdgePositionButton() -> EdgePositionButton{
        let itemButton = EdgePositionButton()

        itemButton.position = .leftImageRightText
        itemButton.setTitle(itemData, for: .normal)
        itemButton.contentSpace = contentSpace

        itemButton.setTitleColor(textColor, for: .normal)
        itemButton.titleLabel!.font = font

        itemButton.addTarget(self, action: #selector(self.handleClick), for: .touchUpInside)

        itemButton.layer.masksToBounds = true
        itemButton.layer.borderWidth = borderWidth
        itemButton.layer.cornerRadius = cornerRadius
        itemButton.layer.borderColor = bordersColor.cgColor

        return itemButton
    }
    
    func removeView() {
        widthOfButtonArray = [0]
        buttonOfX = 0
        allWidth = 0
        allGroup = 0
        
        scrollView.removeAllSubViews()
        scrollView.contentSize = CGSize(width:0, height:30)
    }
    
    @objc func handleClick(btn: UIButton) {
        let index = btn.tag - BarToolsConfig.buttonTag
        delegate?.barToolsClicked(index: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UIView {
    func removeAllSubViews() {
        subviews.forEach {$0.removeFromSuperview()}
    }
}
