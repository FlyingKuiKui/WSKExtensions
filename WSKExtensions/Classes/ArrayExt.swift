//
//  ArrayExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/17.
//

import Foundation

public extension Array {
    internal subscript(nullable idx: Int) -> Element? {
        if (startIndex ..< endIndex).contains(idx) {
            return self[idx]
        }
        return nil
    }
    internal mutating func sk_exchangeObject(at: Int, withObjectAt: Int) {
        if at < 0 || at > self.count-1 || withObjectAt < 0 || withObjectAt > self.count-1 {
            return
        }
        let old = self[at]
        let new = self[withObjectAt]
        
        self[at] = new
        self[withObjectAt] = old
    }
}

extension Array where Element: Equatable {
    mutating func sk_remove(_ object: Element) {
        removeAll { e -> Bool in
            e == object
        }
    }
}
