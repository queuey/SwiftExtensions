
//
//  UIView+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit




// MARK: -
public extension UIView {

    /// view所在Controller
    public func belongToViewController() ->  UIViewController? {
        var next: UIView? = self
        repeat {
            if let vc = next?.next as? UIViewController{ return vc }
            next = next?.superview
        } while next != nil
        return nil
    }

}



// MARK: - AddSubviews
public extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    /// 移除全部子控件
    public func removeSubviews() {
        self.subviews.forEach{$0.removeFromSuperview()}
    }

}



