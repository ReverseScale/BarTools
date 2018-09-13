//
//  ImageTextButton.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2017/2/21.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

import UIKit

class ImageTextButton: UIButton {
    
    // 图片与文字的间距
    @IBInspectable var spacing: CGFloat = 0
    // 是否需要调换图片与文字的左右位置（默认图片在左，文字在右）
    @IBInspectable var isReverse: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// 便利构造函数： 创建按钮图片在上 文字在下的按钮
    ///
    /// - Parameters:
    ///   - font: 按钮文字的字体（含大小）
    ///   - textColor: 按钮文字颜色
    ///   - spacing: 图片与文字的间距
    ///   - imageName: 图片名
    ///   - imageSize: 图片的尺寸
    ///   - title: 按钮的文字
    ///   - aligment: 按钮文字与图片的对其方式
    convenience init(font: UIFont, textColor: UIColor, spacing: CGFloat, imageName: String, imageSize: CGSize, title: String, aligment: NSTextAlignment) {
        self.init()
        let titleDict = [NSAttributedStringKey.font: font, .foregroundColor: textColor]
        let spacingDict = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: spacing)]
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        attachment.bounds = CGRect(origin: .zero, size: imageSize)
        let imageText = NSAttributedString(attachment: attachment)
        let lineText = NSAttributedString(string: "\n\n", attributes: spacingDict)
        let text = NSAttributedString(string: title, attributes: titleDict)
        let attM = NSMutableAttributedString(attributedString: imageText)
        attM.append(lineText)
        attM.append(text)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = aligment
        self.setAttributedTitle(attM, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置按钮中图片的位置
    ///
    /// - Parameter contentRect: 按钮的bounds
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.imageRect(forContentRect: contentRect)
        if isReverse {
            rect.origin.x = contentRect.width - rect.minX - rect.width + spacing * 0.5
        } else {
            rect.origin.x -= spacing * 0.5
        }
        return rect
    }
    
    /// 设置按钮中文字的位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.titleRect(forContentRect: contentRect)
        if isReverse {
            rect.origin.x = contentRect.width - rect.maxX - (currentImage != nil ? spacing * 0.5 : 0)
        } else {
            rect.origin.x += (currentImage != nil ? spacing * 0.5 : 0)
        }
        return rect
    }
    
}

