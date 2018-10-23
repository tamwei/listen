//
//  ExtUILabel.swift
//  listen
//
//  Created by WangBC on 2018/7/18.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    open class func newLabel(fontSize:CGFloat = 17.0,color:UIColor? = UIColor.black,alignment:NSTextAlignment = .left,text:String = "Label")->UILabel{
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.textColor = color
        label.text = text
        return label
    }
    
    
    
    open class func iconLabel(fontSize:CGFloat,color:UIColor,code:String)->UILabel{
        let label = UILabel();
        label.font = UIFont(name: "iconFont", size: fontSize)
        label.textAlignment = .center;
        label.textColor = color
        label.text = code
        return label
    }
    
    
    
}


