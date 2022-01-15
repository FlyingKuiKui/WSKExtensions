//
//  DateExt.swift
//  WSKExtensions
//
//  Created by 王盛魁 on 2022/1/15.
//

import Foundation

public extension Date {
    var sk_year: Int {
        return Calendar.current.component(.year, from: Date())
    }
    
    var sk_month: Int {
        return Calendar.current.component(.month, from: Date())
    }
    
    var sk_day: Int {
        return Calendar.current.component(.day, from: Date())
    }
    
    var sk_hour: Int {
        return Calendar.current.component(.hour, from: Date())
    }
    
    var sk_minute: Int {
        return Calendar.current.component(.minute, from: Date())
    }
    
    var sk_second: Int {
        return Calendar.current.component(.second, from: Date())
    }
    
    var sk_weekday: Int {
        return Calendar.current.component(.weekday, from: Date())
    }
    
    func sk_dateString(_ dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
