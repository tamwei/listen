//
//  Extension.swift
//  listen
//
//  Created by WangBC on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

extension Date{
    
    
    func getDate(year:Int = -1,month:Int = -1,day:Int = -1,hour:Int = -1,minute:Int = -1,second:Int = -1) -> Date {
        var Y = year;
        var M = month;
        var D = day;
        var h = hour;
        var m = minute;
        var s = second;
        
        if(year == -1){
            Y = self.year();
        }
        if(month == -1){
            M = self.month();
        }
        if(day == -1){
            D = self.day();
        }
        if(hour == -1){
            h = self.hour();
        }
        if(minute == -1){
            m = self.minute();
        }
        if(second == -1){
            s = self.second();
        }
        let dateformatter = DateFormatter()
        dateformatter.timeStyle = .full;
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        let str = "\(Y)-\(M.stringValue(2))-\(D.stringValue(2)) \(h.stringValue(2)):\(m.stringValue(2)):\(s.stringValue(2))";
        
        
        let date = dateformatter.date(from: str);
        
        
        return date!
    }
    
    func changeYear(_ value:Int) -> Date {
        return getDate(year:value);
    }
    func changeMonth(_ value:Int) -> Date {
        return getDate(month:value);
    }
    func changeDay(_ value:Int) -> Date {
        return getDate(day:value);
    }
    func changeHour(_ value:Int) -> Date {
        return getDate(hour:value);
    }
    func changeMinute(_ value:Int) -> Date {
        return getDate(minute:value);
    }
    func changeSecond(_ value:Int) -> Date {
        return getDate(second:value);
    }
    
    
    func getComponent(_ component:Calendar.Component) -> Int {
        let calendar = Calendar.current;
        return calendar.component(component, from:self);
    }
    
    func year() -> Int {
        return getComponent(.year);
    }
    func month() -> Int {
        return getComponent(.month);
    }
    func day() -> Int {
        return getComponent(.day);
    }
    func hour() -> Int {
        return getComponent(.hour);
    }
    func minute() -> Int {
        return getComponent(.minute);
    }
    func second() -> Int {
        return getComponent(.second);
    }
    func weekday() -> Int {
        return getComponent(.weekday);
    }
    func weekdayOrdinal() -> Int {
        return getComponent(.weekdayOrdinal);
    }
    func quarter() -> Int {
        return getComponent(.quarter);
    }
    func weekOfMonth() -> Int {
        return getComponent(.weekOfMonth);
    }
    func weekOfYear() -> Int {
        return getComponent(.weekOfYear);
    }
    func yearForWeekOfYear() -> Int {
        return getComponent(.yearForWeekOfYear);
    }
    func nanosecond() -> Int {
        return getComponent(.nanosecond);
    }
    func calendar() -> Int {
        return getComponent(.calendar);
    }
    func timeZone() -> Int {
        return getComponent(.timeZone);
    }
    
    
    func yearStr() -> String {
        return year().stringValue();
    }
    func monthStr() -> String {
        return month().stringValue(2);
    }
    func dayStr() -> String {
        return day().stringValue(2);
    }
    func hourStr() -> String {
        return hour().stringValue(2);
    }
    func minuteStr() -> String {
        return minute().stringValue(2);
    }
    func secondStr() -> String {
        return second().stringValue(2);
    }
    func weekdayStr() -> String {
        let weekArr = ["日","一","二","三","四","五","六"]
        return weekArr[weekday()-1];
    }
    
    //    格式化时间
    func toString(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = dateFormat;
        return formatter.string(from: self);
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding the amount specified to self date
     
     :param: seconds number of seconds to add
     :param: minutes number of minutes to add
     :param: hours number of hours to add
     :param: days number of days to add
     :param: weeks number of weeks to add
     :param: months number of months to add
     :param: years number of years to add
     :returns: the NSDate computed
     */
    public func add(seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, weeks: Int = 0, months: Int = 0, years: Int = 0) -> Date {
        let calendar = NSCalendar.current
        
        let version = floor(NSFoundationVersionNumber)
        
        if version <= NSFoundationVersionNumber10_9_2 {
            var component = DateComponents()
            component.setValue(seconds, for: .second)
            var date : Date! = calendar.date(byAdding: component, to: self);
            
            component = DateComponents()
            component.setValue(minutes, for: .minute)
            date = calendar.date(byAdding: component, to: self)!
            
            component = DateComponents()
            component.setValue(hours, for: .hour)
            date = calendar.date(byAdding: component, to: self)!
            
            component = DateComponents()
            component.setValue(days, for: .day)
            date = calendar.date(byAdding: component, to: self)!
            
            component = DateComponents()
            component.setValue(weeks, for: .weekOfMonth)
            date = calendar.date(byAdding: component, to: self)!
            
            component = DateComponents()
            component.setValue(months, for: .month)
            date = calendar.date(byAdding: component, to: self)!
            
            component = DateComponents()
            component.setValue(years, for: .year)
            date = calendar.date(byAdding: component, to: self)!
            return date
        }
        
        var date : Date! = calendar.date(byAdding: .second, value: seconds, to: self)
        date = calendar.date(byAdding: .minute, value: minutes, to: self)
        date = calendar.date(byAdding: .day, value: days, to: self)
        date = calendar.date(byAdding: .hour, value: hours, to: self)
        date = calendar.date(byAdding: .weekOfMonth, value: weeks, to: self)
        date = calendar.date(byAdding: .month, value: months, to: self)
        date = calendar.date(byAdding: .year, value: years, to: self)
        return date
    }
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of seconds to self date
     
     :param: seconds number of seconds to add
     :returns: the NSDate computed
     */
    public func addSeconds (seconds: Int) -> Date {
        return add(seconds: seconds)
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of minutes to self date
     
     :param: minutes number of minutes to add
     :returns: the NSDate computed
     */
    public func addMinutes (minutes: Int) -> Date {
        return add(minutes: minutes)
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of hours to self date
     
     :param: hours number of hours to add
     :returns: the NSDate computed
     */
    public func addHours(hours: Int) -> Date {
        return add(hours: hours)
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of days to self date
     
     :param: days number of days to add
     :returns: the NSDate computed
     */
    public func addDays(days: Int) -> Date {
        return add(days: days)
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of weeks to self date
     
     :param: weeks number of weeks to add
     :returns: the NSDate computed
     */
    public func addWeeks(weeks: Int) -> Date {
        return add(weeks: weeks)
    }
    
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of months to self date
     
     :param: months number of months to add
     :returns: the NSDate computed
     */
    
    public func addMonths(months: Int) -> Date {
        return add(months: months)
    }
    
    /**
     Returns a new NSDate object representing the date calculated by adding an amount of years to self date
     
     :param: years number of year to add
     :returns: the NSDate computed
     */
    public func addYears(years: Int) -> Date {
        return add(years: years)
    }
}










