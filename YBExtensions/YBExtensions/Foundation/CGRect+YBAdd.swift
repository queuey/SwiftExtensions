//
//  CGRect+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit

public extension CGRect {

    /// X
    public var x: CGFloat {
        set { self.origin.x = newValue }
        get { return self.origin.x }
    }

    /// Y
    public var y: CGFloat {
        set { self.origin.y = newValue }
        get { return self.origin.y }
    }

    /// width
    public var width: CGFloat {
        set { self.size.width = newValue }
        get { return self.size.width }
    }

    /// height
    public var height: CGFloat {
        set { self.size.height = newValue }
        get { return self.size.height }
    }

}
