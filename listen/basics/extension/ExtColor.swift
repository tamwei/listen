//
//  ExtColor.swift
//  listen
//
//  Created by WangBC on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    
    
   
    
    
    open class func colorWithHexString(hexString:String) -> UIColor? {
        
        var hexStr = NSString(string: hexString)
        
        if (hexStr.hasPrefix("#")) {
            hexStr = hexStr.substring(from: 1) as NSString;
        }
        if hexStr.length != 3 && hexStr.length != 6 && hexStr.length != 8{
            return nil;
        }
        var itemLength = 2
        var startIndex = 0;
        if hexStr.length == 3 {
            itemLength = 1;
        }
        var s0:String = "FF";
        if(hexStr.length == 8){
            s0 = hexStr.substring(with: NSRange(location:startIndex + itemLength, length: itemLength))
            startIndex = startIndex + itemLength;
        }
        let s1:String = hexStr.substring(with: NSRange(location:startIndex + itemLength * 0, length: itemLength))
        let s2:String = hexStr.substring(with: NSRange(location:startIndex + itemLength * 1, length: itemLength))
        let s3:String = hexStr.substring(with: NSRange(location:startIndex + itemLength * 2, length: itemLength))
        
        
        
        
        return UIColor(red:CGFloat(s1.hex2dec())/255.0, green:CGFloat(s2.hex2dec()) / 255.0, blue:CGFloat(s3.hex2dec()) / 255.0, alpha:CGFloat(s0.hex2dec()) / 255.0)
        
    }
    

}
