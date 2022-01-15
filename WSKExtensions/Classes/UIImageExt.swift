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
        
    /// image compress 图片压缩
    /// - Parameter byte: 最大图片大小，默认 1M
    /// - Returns: compress image data 图片压缩后的大小
    func sk_compress(maxByteLength byte: UInt = 1024 * 1024 * 1) -> Data? {
        var data = self.jpegData(compressionQuality: 1)
        print("压缩前: \(data?.count ?? 0)")
        
        if data?.count ?? 0 < byte {
            return data
        }
        let dataCount = CGFloat(data?.count ?? 1)
        let compress = CGFloat(byte) / dataCount
        data = self.jpegData(compressionQuality: compress)
        print("压缩率: \(compress)")
        print("压缩后: \(data?.count ?? 0)")
        return data
    }
}
