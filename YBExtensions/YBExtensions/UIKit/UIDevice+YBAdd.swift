//
//  UIDevice+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
    


public extension UIDevice {


    public class func idForVendorString() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }


    public class func systemName() -> String {
        return UIDevice.current.systemName
    }

    public class func name() -> String {
        return UIDevice.current.name
    }

    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }


    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }


    public class func language() -> String {
        return Bundle.main.preferredLocalizations[0]
    }


    public class func deviceModelReadable() -> String {
        return DeviceVersion.list[deviceModel()] ?? deviceModel()
    }


    /// 判断是否全面屏
    ///
    /// - Returns: 返回Bool值 无默认值
    public class func isAllScreen() -> Bool {
        let iphoneName = deviceModelReadable()
        if iphoneName == "iPhone X" || iphoneName == "iPhone XR" || iphoneName == "iPhone XS Max" { return true }
        return false
    }


    /// 判断设备是否为iPhone
    ///
    /// - Returns: Returns true if the device is iPhone
    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    /// 判断设备是否为iPad
    ///
    /// - Returns: Returns true if the device is iPad
    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }


    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)

        for child in mirror.children {
            let value = child.value

            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }

        return identifier
    }



    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
        case eleven = 11.0
        case twelve = 12.0
        case thirteen = 13.0
    }

    public class func isVersion(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue && systemFloatVersion() < (version.rawValue + 1.0)
    }

    public class func isVersionOrLater(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue
    }

    public class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return systemFloatVersion() < (version.rawValue + 1.0)
    }

    public class var CURRENT_VERSION: String {
        return "\(systemFloatVersion())"
    }



    /// EZSwiftExtensions
    public class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }


    private enum DeviceVersion {
        /// EZSwiftExtensions
        static let list = [
            /* iPod 5 */
            "iPod5,1": "iPod Touch 5",
            /* iPod 6 */
            "iPod7,1": "iPod Touch 6",
            /* iPhone 4 */
            "iPhone3,1": "iPhone 4", "iPhone3,2": "iPhone 4", "iPhone3,3": "iPhone 4",
            /* iPhone 4S */
            "iPhone4,1": "iPhone 4S",
            /* iPhone 5 */
            "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5",
            /* iPhone 5C */
            "iPhone5,3": "iPhone 5C", "iPhone5,4": "iPhone 5C",
            /* iPhone 5S */
            "iPhone6,1": "iPhone 5S", "iPhone6,2": "iPhone 5S",
            /* iPhone 6 */
            "iPhone7,2": "iPhone 6",
            /* iPhone 6 Plus */
            "iPhone7,1": "iPhone 6 Plus",
            /* iPhone 6S */
            "iPhone8,1": "iPhone 6S",
            /* iPhone 6S Plus */
            "iPhone8,2": "iPhone 6S Plus",
            /* iPhone 7 */
            "iPhone9,1": "iPhone 7", "iPhone9,3": "iPhone 7",
            /* iPhone 7 Plus */
            "iPhone9,2": "iPhone 7 Plus", "iPhone9,4": "iPhone 7 Plus",
            /* iPhone SE */
            "iPhone8,4": "iPhone SE",
            /* iPhone 8 */
            "iPhone10,1": "iPhone 8", "iPhone10,4": "iPhone 8",
            /* iPhone 8 Plus */
            "iPhone10,2": "iPhone 8 Plus", "iPhone10,5": "iPhone 8 Plus",
            /* iPhone X */
            "iPhone10,3": "iPhone X", "iPhone10,6": "iPhone X",
            /* iPhone XS */
            "iPhone11,2": "iPhone XS",
            /* iPhone XS Max */
            "iPhone11,4": "iPhone XS Max", "iPhone11,6": "iPhone XS Max",
            /* iPhone XR */
            "iPhone11,8": "iPhone XR",


            /* iPad 2 */
            "iPad2,1": "iPad 2", "iPad2,2": "iPad 2", "iPad2,3": "iPad 2", "iPad2,4": "iPad 2",
            /* iPad 3 */
            "iPad3,1": "iPad 3", "iPad3,2": "iPad 3", "iPad3,3": "iPad 3",
            /* iPad 4 */
            "iPad3,4": "iPad 4", "iPad3,5": "iPad 4", "iPad3,6": "iPad 4",
            /* iPad Air */
            "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
            /* iPad Air 2 */
            "iPad5,3": "iPad Air 2", "iPad5,4": "iPad Air 2",
            /* iPad Mini */
            "iPad2,5": "iPad Mini", "iPad2,6": "iPad Mini", "iPad2,7": "iPad Mini",
            /* iPad Mini 2 */
            "iPad4,4": "iPad Mini 2", "iPad4,5": "iPad Mini 2", "iPad4,6": "iPad Mini 2",
            /* iPad Mini 3 */
            "iPad4,7": "iPad Mini 3", "iPad4,8": "iPad Mini 3", "iPad4,9": "iPad Mini 3",
            /* iPad Mini 4 */
            "iPad5,1": "iPad Mini 4", "iPad5,2": "iPad Mini 4",
            /* iPad Pro */
            "iPad6,7": "iPad Pro", "iPad6,8": "iPad Pro",
            /* AppleTV */
            "AppleTV5,3": "AppleTV",
            /* Simulator */
            "x86_64": "Simulator", "i386": "Simulator"
        ]
    }


}


#endif
