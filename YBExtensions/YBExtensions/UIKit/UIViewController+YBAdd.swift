//
//  UIViewController+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit


// MARK: - LargeTitle
extension UIViewController {

    /// 使用LargeTitle
    ///
    /// - Parameters:
    ///   - color: 大标题颜色
    ///   - font: 大标题字体
    public func prefersLargeTitle(color: UIColor, font: UIFont) {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color,
                                                                            NSAttributedString.Key.font: font]
            extendedLayoutIncludesOpaqueBars = true
        }
    }

    /// 使用普通Title
    public func prefersNormalTitle() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }

}
