//
//  UIImageExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation
import UIKit

public extension UIImage {
    /**
     * 将图片裁剪成指定比例（多余部分自动删除） 宽/高
     */
    func sk_crop(ratio: CGFloat) -> UIImage {
        // 计算最终尺寸
        var newSize: CGSize!
        if size.width / size.height > ratio {
            newSize = CGSize(width: size.height * ratio, height: size.height)
        } else {
            newSize = CGSize(width: size.width, height: size.width / ratio)
        }
     
        ////图片绘制区域
        var rect = CGRect.zero
        rect.size.width = size.width
        rect.size.height = size.height
        rect.origin.x = (newSize.width - size.width) / 2.0
        rect.origin.y = (newSize.height - size.height) / 2.0
         
        // 绘制并获取最终图片
        UIGraphicsBeginImageContext(newSize)
        draw(in: rect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        return scaledImage!
    }
}
