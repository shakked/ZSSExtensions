//
//  Date+Extensions.swift
//  Instagrowth
//
//  Created by Zachary Shakked on 1/11/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension Date {
    
    func sameWeek(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let sameWeek = (calendar as NSCalendar).compare(self , to: date, toUnitGranularity: NSCalendar.Unit.weekOfYear) == .orderedSame
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return sameWeek
    }
    
    func isBetween(_ startRangeDate: Date, endRangeDate: Date) -> Bool {
        var result : Bool = false
        if ((self.compare(startRangeDate) == ComparisonResult.orderedDescending) || (self.compare(startRangeDate) == ComparisonResult.orderedSame)) && self.compare(endRangeDate) == ComparisonResult.orderedAscending {
            result = true
        }
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        
        return result
    }

    static func <(a: Date, b: Date) -> Bool {
        return a.compare(b ) == ComparisonResult.orderedAscending
    }
    
    static func ==(a: Date, b: Date) -> Bool {
        return a.compare(b ) == ComparisonResult.orderedSame
    }

    func timeAgo(_ numericDates:Bool = true) -> String {
        
        let calendar = Calendar.current
        let now = Date()
        let earliest = (now as NSDate).earlierDate(self)
        let latest = (earliest == now ) ? self : now
        let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest , options: NSCalendar.Options())
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
    }
}
