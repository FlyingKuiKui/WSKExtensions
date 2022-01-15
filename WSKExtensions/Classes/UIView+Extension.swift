//
//  UIView+Extension.swift
//  ceshi-swift
//
//  Created by 王盛魁 on 2022/1/14.
//

import Foundation
import UIKit

extension UIView {
    var sk_minX: CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.bounds.minX
        }
    }

    var sk_maxX: CGFloat {
        return self.bounds.maxX
    }
}
