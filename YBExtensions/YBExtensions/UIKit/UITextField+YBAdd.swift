//
//  UITextField+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit


// MARK: - UITextField extension
public extension UITextField {

    /// 占位文字颜色
    public var placeholderColor: UIColor? {
        get {
            guard var attr = attributedPlaceholder?.attributes(at: 0, effectiveRange: nil),
                let color = attr[NSAttributedString.Key.foregroundColor] as? UIColor else{ return textColor }
            return color
        }
        set {
            guard let placeholder = self.placeholder, let color = newValue else { return }
            if var attr = attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) {
                attr[NSAttributedString.Key.foregroundColor] = newValue
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
                return
            }

            let attr = [NSAttributedString.Key.foregroundColor: color]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
        }
    }

    /// 占位文字字体
    public var placeholderFont: UIFont? {
        get {
            guard var attr = attributedPlaceholder?.attributes(at: 0, effectiveRange: nil),
                let ft = attr[.font] as? UIFont else{ return font }
            return ft
        }
        set {
            guard let placeholder = self.placeholder, let font = newValue else { return }
            if var attr = attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) {
                attr[NSAttributedString.Key.font] = newValue
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
                return
            }
            let attr = [NSAttributedString.Key.font: font]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
        }
    }


    /// 左边间距
    @IBInspectable var leftPadding: CGFloat {
        get {
            return leftView?.frame.size.width ?? 0
        }
        set {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = view
            leftViewMode = .always
        }
    }

    /// 右边间距
    @IBInspectable var rightPadding: CGFloat {
        get {
            return rightView?.frame.size.width ?? 0
        }
        set {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = view
            rightViewMode = .always
        }
    }

}
