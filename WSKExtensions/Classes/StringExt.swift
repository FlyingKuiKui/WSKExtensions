//
//  StringExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import CommonCrypto
import Foundation

public extension String {
    /// 获取字符串对应的MD5值
    var sk_md5: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format: "%02X", $1) }.lowercased()
    }

    /// 获取字符串对应的sha256值
    var sk_sha256: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format: "%02x", $1) }
    }

    // MARK: 获取字符出现的位置信息(支持多次位置获取)

    /// - Parameter string: 原始文本
    /// - Parameter inString: 需要查找的字符
    func sk_rangeOfString(inString: String) -> [NSRange] {
        var arrRange = [NSRange]()
        var _fullText = (self as NSString)
        var rang: NSRange = _fullText.range(of: inString)

        while rang.location != NSNotFound {
            var location: Int = 0
            if arrRange.count > 0 {
                if arrRange.last!.location + arrRange.last!.length < (self as NSString).length {
                    location = arrRange.last!.location + arrRange.last!.length
                }
            }
            _fullText = NSString(string: _fullText.substring(from: rang.location + rang.length))

            if arrRange.count > 0 {
                rang.location += location
            }
            arrRange.append(rang)
            rang = _fullText.range(of: inString)
        }

        return arrRange
    }

    // MARK: 截取规定下标之后的字符串

    func sk_subStringFrom(index: Int) -> String {
        let temporaryString: String = self
        if temporaryString.count <= index {
            return ""
        }
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        return String(temporaryString[temporaryIndex...])
    }

    // MARK: 截取规定下标之前的字符串

    func sk_subStringTo(index: Int) -> String {
        let temporaryString = self
        if temporaryString.count <= index {
            return temporaryString
        }
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        return String(temporaryString[...temporaryIndex])
    }

    // MARK: 截取到任意位置

    func sk_subString(to: Int) -> String {
        let index: String.Index = self.index(startIndex, offsetBy: to)
        return String(self[..<index])
    }

    // MARK: 从任意位置开始截取

    func sk_subString(from: Int) -> String {
        let index: String.Index = self.index(startIndex, offsetBy: from)
        return String(self[index ..< endIndex])
    }

    // MARK: 从任意位置开始截取到任意位置

    func sk_subString(from: Int, to: Int) -> String {
        let beginIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[beginIndex...endIndex])
    }

    // MARK: 使用下标截取到任意位置

    subscript(to: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: to)
        return String(self[..<index])
    }

    // MARK: 使用下标从任意位置开始截取到任意位置

    subscript(from: Int, to: Int) -> String {
        let beginIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[beginIndex...endIndex])
    }

    // MARK: 获取文本高度

    func sk_getTextHeigh(font: UIFont, width: CGFloat) -> CGFloat {
        let normalText: NSString = self as NSString
        let size = CGSize(width: width, height: 1000)
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context: nil).size
        return stringSize.height
    }

    // MARK: 获取文本宽度

    func sk_getTextWidth(font: UIFont, height: CGFloat) -> CGFloat {
        let normalText: NSString = self as NSString
        let size = CGSize(width: 1000, height: height)
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context: nil).size
        return stringSize.width
    }

    /// EZSE: Checks if string is empty or consists only of whitespace and newline characters
    var sk_isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty
    }

    // MARK: 校验字符串中是否包含Emoji

    func sk_includesEmoji() -> Bool {
        for i in 0 ..< count {
            let c: unichar = (self as NSString).character(at: i)
            if (c >= 0xD800 && c <= 0xDBFF) || (c >= 0xDC00 && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }
}

extension Optional where Wrapped == String {
    // MARK: 校验字符串中是否是nil或者为空
    var sk_isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }

    var sk_isNilOrBlank: Bool {
        return self?.sk_isBlank ?? true
    }
}
