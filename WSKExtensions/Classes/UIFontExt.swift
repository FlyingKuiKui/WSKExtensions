//
//  UIFontExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation

public enum PingFangType: String {
    case Regular // 常规体
    case Medium // 中黑体
    case Ultralight // 极细体
    case Thin // 纤细体
    case Light // 细体
    case Semibold // 中粗体
}

public extension UIFont {
    /**
     * 苹方简体
     */
    class func sk_PingFang(type: PingFangType, size: CGFloat) -> UIFont {
        let name = "PingFangSC-\(type.rawValue)"
        return UIFont(name: name, size: size) ?? UIFont()
    }

    /**
     * BebasNeue
     */
    class func sk_BebasNeue(size: CGFloat) -> UIFont {
        return UIFont(name: "BebasNeue", size: size) ?? UIFont()
    }
}
