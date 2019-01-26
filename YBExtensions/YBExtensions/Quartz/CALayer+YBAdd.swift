//
//  CALayer+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit



// MARK: - 为CALayer增加链式函数
extension CALayer {

    @discardableResult
    func cornerRadius(_ radius:CGFloat) -> CALayer {
        self.cornerRadius = radius
        return self
    }

    @discardableResult
    func border(width:CGFloat, _ color:UIColor) -> CALayer {
        self.borderWidth = width
        self.borderColor = color.cgColor
        return self
    }

}
