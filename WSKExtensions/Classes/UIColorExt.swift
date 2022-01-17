//
//  UIColorExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation
import UIKit

public extension UIColor {
    /// 获取随机色
    class var sk_randomColor: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    /// 十六进制颜色
    /// - Parameters:
    ///   - hexStr: 十六进制字符串 0x/#
    ///   - alpha: 透明度，默认值1.0
    /// - Returns: 返回UIColor
    class func sk_hexColor(hexStr: String, alpha: CGFloat = 1.0) -> UIColor {
        var cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString
        
        if cStr.length < 6 {
            return UIColor.clear
        }
        
        if cStr.hasPrefix("0x") {
            cStr = cStr.substring(from: 2) as NSString
        }
        
        if cStr.hasPrefix("#") {
            cStr = cStr.substring(from: 1) as NSString
        }
        
        if cStr.length != 6 {
            return UIColor.clear
        }
        
        let rStr = (cStr as NSString).substring(to: 2)
        let gStr = ((cStr as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bStr = ((cStr as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
}
