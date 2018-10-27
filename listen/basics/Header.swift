//
//  Header.swift
//  HaoBan
//
//  Created by WangBC on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation
import UIKit

import Log

import Kingfisher
@_exported import SnapKit
@_exported import SwiftProgressHUD
@_exported import RxSwift
@_exported import RxCocoa
@_exported import RxBlocking
@_exported import RxDataSources
@_exported import ObjectMapper
@_exported import RxAlamofire



let KisDebug = true

let KScreenWidth = UIScreen.main.bounds.size.width;


let KScreenHeight = UIScreen.main.bounds.size.height;


func RGBA(r:CGFloat , g:CGFloat , b:CGFloat,a:CGFloat) -> UIColor {
    let R:CGFloat = 255.0
    return UIColor(red: r/R, green: g/R, blue: b/R, alpha: a)
}

func colorHex(hexString : String) -> UIColor {
    var hexStr = NSString(string: hexString)
    
    if (hexStr.hasPrefix("#")) {
        hexStr = hexStr.substring(from: 1) as NSString;
    }
    if hexStr.length != 3 && hexStr.length != 6 && hexStr.length != 8{
        return UIColor.white;
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

func setTimeOut(function:(()->())?,time:TimeInterval,queue:DispatchQueue = DispatchQueue.main){
    queue.asyncAfter(deadline: DispatchTime.now()+time, execute: function!);
}




func DLog(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) -> () {
    if KisDebug{
        if(items.count>0){
            let itemsStr:CVarArg = items.map({ String(describing: $0) }).joined(separator: separator)
            let arguments = [
                Date().toString(),
                NSString(string: file).lastPathComponent,
                NSString(string: "\(line)"),
                itemsStr
            ]
            let log = String(format: "[%@]%@:%@ %@", arguments: arguments);
            Swift.print(log)
        }
    }
}

func setStatusBarBackgroundColor(color:UIColor) {
    let obj:AnyObject = UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject
    let statusBar:UIView? = obj.value(forKey: "statusBar") as? UIView
    if((statusBar) != nil) {
        statusBar?.backgroundColor = color
    }
}

let kTitleColor = UIColor.colorWithHexString(hexString: "#333333")  //标题,重要文字
let kTextColor = UIColor.colorWithHexString(hexString: "#666666")   //普通文字

let kSubTextColor = UIColor.colorWithHexString(hexString: "#A5AFB8")  // 辅助文字
let kTipTextColor = UIColor.colorWithHexString(hexString: "#CBD0D7")  // 提示性文字

let kSelectTitleColor = UIColor.colorWithHexString(hexString: "#448CFA")  //选中标题

let kVCBgColor = UIColor.colorWithHexString(hexString: "#F0F2F5")


let kLineColor = UIColor.colorWithHexString(hexString: "#E8E9ED")
let kBorderColor = UIColor.colorWithHexString(hexString: "#D6DADE")?.cgColor

