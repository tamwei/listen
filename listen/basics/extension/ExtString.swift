//
//  ExtString.swift
//  HaoBan
//
//  Created by WangBC on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

extension String{
   
    
    /// 判断是否是手机号
    func isPhoneNumber() -> Bool {
        
        let pattern = "^1[345789]\\d{9}$"
        
        return NSPredicate.init(format:"SELF MATCHES %@",pattern).evaluate(with: self)
        
    }
    
    func toDate(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter();
        formatter.dateFormat = dateFormat;
        return formatter.date(from: self)!;
    }
    
    func toDateTime(dateFormat:String = "yyyy-MM-dd") -> Date {
        return self.toDate(dateFormat:dateFormat);
    }
    
    func toFloat() -> Float {
        var floatValue = Float(0);
        if let floatVal = Float(self){
            floatValue = floatVal;
        }
        return floatValue
    }
    
    func toInt() -> Int {
        var intValue = Int(0);
        if let intVal = Int(self){
            intValue = intVal;
        }
        return intValue
    }
    
    func hex2dec() -> Float {
        let str = self.uppercased()
        var sum:Float = 0
        for i in str.utf8 {
            sum = sum * 16 + Float(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
    
   

}



