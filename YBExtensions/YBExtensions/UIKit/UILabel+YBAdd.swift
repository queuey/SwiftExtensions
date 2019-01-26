
//
//  UILabel+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit



// MARK: - UILabel Extension
extension UILabel {

    /// 调整文字绘制区域
    public var textInset: UIEdgeInsets {
        get{
            guard let eventInterval = objc_getAssociatedObject(self, UILabel.SwzzlingKeys.textInset!) as? UIEdgeInsets  else {
                return .zero
            }
            return eventInterval
        }
        set {
            UILabel.swizzig()
            objc_setAssociatedObject(self, UILabel.SwzzlingKeys.textInset!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            drawText(in: bounds)
        }
    }

    @objc fileprivate func yb_drawText(in rect: CGRect) {
        let rect = CGRect(x: bounds.origin.x + textInset.left,
                          y: bounds.origin.y + textInset.top,
                          width: bounds.size.width - textInset.left - textInset.right,
                          height: bounds.size.height - textInset.top - textInset.bottom)
        yb_drawText(in: rect)
    }

}


// MARK: - runtime and swizzling
fileprivate extension UILabel {
    fileprivate static var once: Bool = false
    fileprivate class func swizzig() {
        guard once == false else { return }
        once = true

        let select1 = #selector(UILabel.drawText(in:))
        let select2 = #selector(UILabel.yb_drawText(in:))
        let classType = UILabel.self
        let select1Method = class_getInstanceMethod(classType, select1)
        let select2Method = class_getInstanceMethod(classType, select2)




        let didAddMethod  = class_addMethod(classType, select1,
                                            method_getImplementation(select2Method!),
                                            method_getTypeEncoding(select2Method!))

        if didAddMethod {
            class_replaceMethod(classType, select2,
                                method_getImplementation(select1Method!),
                                method_getTypeEncoding(select1Method!))
        } else {
            method_exchangeImplementations(select1Method!, select2Method!)
        }

    }

    fileprivate struct SwzzlingKeys {
        static var textInset = UnsafeRawPointer(bitPattern: "UILabelTextInset".hashValue)
    }
}
