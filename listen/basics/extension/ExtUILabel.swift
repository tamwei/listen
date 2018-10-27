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
    open class func label(fontSize:CGFloat = 17.0,color:UIColor? = UIColor.black,alignment:NSTextAlignment = .left)->UILabel{
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.textColor = color
        return label
    }
    
    
    func configLab(fontSize:CGFloat,color:UIColor,align:NSTextAlignment) {
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = color
        self.textAlignment = align
    }
    
    
    
    
}


