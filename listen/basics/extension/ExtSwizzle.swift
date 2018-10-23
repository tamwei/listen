//
//  ExtSwizzle.swift
//  listen
//
//  Created by tw on 2018/9/25.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

extension NSObject {
    open class func rt_swizzle(originSelector:Selector, swizzleSelector:Selector) {
        guard let m1 = class_getInstanceMethod(self, originSelector) else {
            return
        }
        guard let m2 = class_getInstanceMethod(self, swizzleSelector) else {
            return
        }
        
        if (class_addMethod(self, swizzleSelector, method_getImplementation(m2), method_getTypeEncoding(m2))) {
            class_replaceMethod(self, swizzleSelector, method_getImplementation(m1), method_getTypeEncoding(m1))
        } else {
            method_exchangeImplementations(m1, m2)
        }
    }
    

}



extension UIViewController {
   
    
   
    // 交换 tableview 的代理方法
    static func rt_swizzle()  {
        
        self.rt_swizzle(originSelector: #selector(viewWillAppear(_:)), swizzleSelector: #selector(rt_viewWillAppear(_:)))
        
    }
    
    @objc func rt_viewWillAppear(_ animated: Bool) {
        rt_viewWillAppear(animated)
        print("swizzle_viewWillAppear",self)
    }
    

    
}


