//
//  UIButton+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit



// MARK: - 给UIButton增加闭包响应事件
public extension UIButton {

    struct AssociatedClosureClass {
        var eventClosure: ()->()
    }

    private struct AssociatedKeys {
        static var onekey: AssociatedClosureClass?
    }

    private var eventClosureObj: AssociatedClosureClass {
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.onekey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            return (objc_getAssociatedObject(self, &AssociatedKeys.onekey) as? AssociatedClosureClass)!
        }
    }


    /// 增加闭包响应事件
    ///
    /// - Parameters:
    ///   - controlEvents: 响应事件类型 defalut = .touchUpInside
    ///   - action: 逃逸闭包
    public func addAction(for controlEvents: UIControl.Event = UIControl.Event.touchUpInside,action: @escaping ()->()) {
        let eventObject = AssociatedClosureClass(eventClosure: action)
        eventClosureObj = eventObject
        addTarget(self, action: #selector(eventExcuate(_:)), for: controlEvents)
    }

    @objc private func eventExcuate(_ sender: UIButton){
        eventClosureObj.eventClosure()
    }

}


// MARK: - 修改文字与图片位置
extension UIButton {
    //枚举图片的位置
    enum ButtonImageEdgeInsetsStyle {
        case top    //上图下文字
        case left   //左图右文字
        case bottom //下图上文字
        case right  //右图左文字
    }
    // style:图片位置 space:图片与文字的距离
    func layoutButtonImageEdgeInsetsStyle(style:ButtonImageEdgeInsetsStyle,space:CGFloat) {
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!

        var labelWidth:CGFloat = 0
        var labelHeight:CGFloat = 0

        labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
        labelHeight = (self.titleLabel?.intrinsicContentSize.height)!

        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero

        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space/2.0, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -labelWidth-space/2.0, bottom: 0, right: labelWidth+space/2.0)
        }

        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }

    func setBtnNormal(fromColor:UIColor, toColor:UIColor, direction: NSLayoutConstraint.Axis) {
        self.isEnabled = true
        if (self.layer.sublayers == nil || self.layer.sublayers!.count < 2) {
            let gradientColors: [CGColor] = [fromColor.cgColor, toColor.cgColor]
            let gradientLayer: CAGradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors
            if (direction == .horizontal) {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:1, y:0)

            } else if(direction == .vertical) {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:0, y:1)

            } else {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:1, y:1)

            }
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
            self.layer.cornerRadius = 4
            self.clipsToBounds = true
            self.setTitleColor(UIColor.white, for: .normal)

        }

    }
    func setBtnDisEnbled() {
        if (self.layer.sublayers != nil && self.layer.sublayers!.count > 1) {
            self.layer.sublayers?.remove(at: 0)

        }
        self.isEnabled = false
        //        self.setTitleColor(MainTextColor, for: .disabled)
        //        self.backgroundColor = BtnDisEnbledColor
    }

}


