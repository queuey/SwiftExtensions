//
//  String+YBAdd.swift
//  YBExtensions
//
//  Created by yang bin on 2019/1/26.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation
import CommonCrypto


// MARK: - 给String扩展SubString方法
public extension String {

    /// SubStringk从某个位置开始
    ///
    /// - Parameter index: 开始下标
    /// - Returns: String类型的字符串
    public func substring(from index: Int) -> String {
        guard index < self.count, index >= 0 else {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: index)
        let subString = self[startIndex..<self.endIndex]
        return String(subString)

    }

    /// SubString 到某个位置
    ///
    /// - Parameter index: 结束下标
    /// - Returns: String类型的字符串
    public func substring(to index: Int) -> String {

        guard  index < self.count  else {
            return self
        }
        let endIndex = self.index(self.startIndex, offsetBy: index)
        let subString = self[self.startIndex..<endIndex]
        return String(subString)
    }

    //获取子字符串
    func substingInRange(_ r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return String(self[startIndex..<endIndex])
    }

}


// MARK: - MD5
public extension String {

    /// MD5加密
    ///
    /// - Returns: 返回一个MD5 String
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
}





