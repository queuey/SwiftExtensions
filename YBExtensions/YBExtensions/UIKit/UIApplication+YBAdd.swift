//
//  UIApplication+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit

// MARK: - open
public extension UIApplication {

    /// 打开链接 (会判断 能否打开)
    ///
    /// - Parameter url: url
    @discardableResult
    public func open(url: String) -> Bool {
        guard let str = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: str),
            UIApplication.shared.canOpenURL(url) else { return false }
        unsafeOpen(url: url)
        return true
    }

    /// 打开链接 (不会判断 能否打开)
    ///
    /// - Parameter url: url
    public func unsafeOpen(url: String) {
        guard let str = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: str) else { return }
        unsafeOpen(url: url)
    }

    /// 打开链接 (不会判断 能否打开)
    ///
    /// - Parameter url: url
    public func unsafeOpen(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

}
