//
//  KTextField.swift
//  listen
//
//  Created by tw on 2018/10/22.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class KTextField: UITextField {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.borderStyle = .none
        self.leftViewMode = .always
        self.addBottomLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
       self.borderStyle = .none
       self.leftViewMode = .always
       self.addBottomLine()

       
    }
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 10
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       var rect = super.textRect(forBounds: bounds)
       rect.origin.x += 15
       return rect

    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x += 15
        return rect
    }
    
    
}
