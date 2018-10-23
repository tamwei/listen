//
//  ExtInt.swift
//  listen
//
//  Created by WangBC on 2018/7/19.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

extension Int{
    func stringValue(_ length:Int = -1) -> String {
        var string = "\(self)";
        
        if(length > string.count){
            if(self < 0){
                let value = -self;
                return "-" + value.stringValue(length-1);
            }else{
                for _ in 0...(length - string.count - 1){
                    string = "0" + string;
                }
            }
        }
        return string;
    }
}
