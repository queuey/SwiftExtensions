//
//  UIImageView+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit


// MARK: - 快速初始化
public extension UIImageView {

    /// init
    ///
    /// - Parameter imageName: 图片名
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
}


public extension UIImageView {


    /// 毛玻璃效果
    ///
    /// - Parameter style: 毛玻璃样式
    public func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.clipsToBounds = true
    }


    /// 毛玻璃效果
    ///
    /// - Parameter style: 毛玻璃样式[[
    public func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        blur(withStyle: style)
        return self
    }

}
