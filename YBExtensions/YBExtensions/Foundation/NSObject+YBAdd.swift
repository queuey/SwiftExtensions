//
//  NSObject+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation


protocol Builder {}


// MARK: - Builder extension
extension Builder {

    ///
    ///
    /// - Parameter configure: closure
    /// - Returns: Self
    public func with(configure: (inout Self) -> Void) -> Self {
        var this = self
        configure(&this)
        return this
    }
}

// MARK: - 遵守Builder协议
extension NSObject: Builder { }


