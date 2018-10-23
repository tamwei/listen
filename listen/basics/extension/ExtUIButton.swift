//
//  ExtUIButton.swift
//  listen
//
//  Created by tw on 2018/9/28.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

extension UIButton {
    
    open class func button(title:String,color:UIColor?,font:UIFont?) -> UIButton {
       let btn = UIButton()
       btn.setTitle(title, for: .normal)
       btn.setTitleColor(color, for: .normal)
       btn.titleLabel?.font = font!
       return btn
    }
}
