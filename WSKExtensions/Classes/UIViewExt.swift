//
//  UIViewExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation
import UIKit

public extension UIView {
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

    var sk_maxY: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
}
