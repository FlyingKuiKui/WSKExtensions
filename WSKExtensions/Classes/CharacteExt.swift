//
//  CharacteExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation

public extension Character {
    /// EZSE: Converts Character to String //TODO: Add to readme
    var sk_toString: String { return String(self) }

    /// EZSE: If the character represents an integer that fits into an Int, returns the corresponding integer.
    /// TODO: Add to readme
    var sk_toInt: Int? { return Int(String(self)) }

    /// EZSE: Convert the character to lowercase
    var sk_lowercased: Character {
        let s = String(self).lowercased()
        return s[s.startIndex]
    }

    /// EZSE: Convert the character to uppercase
    var sk_uppercased: Character {
        let s = String(self).uppercased()
        return s[s.startIndex]
    }

    /// EZSE : Checks if character is emoji
    internal var sk_isEmoji: Bool {
        return String(self).sk_includesEmoji()
    }
}
