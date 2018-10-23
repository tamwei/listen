//
//  ExtUIAlertController.swift
//  listen
//
//  Created by tw on 2018/9/11.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

var rt_navigationBarHiddenKey = "navigationBarHiddenKey"


extension UIViewController{
    
    

    func showAlertView(title:String, message:String,leftTitle:String, leftEventHandler:(()->())?,rightTitle:String,rightEventHandler:(()->())?,completion:(()->())?) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let leftAction:UIAlertAction = UIAlertAction(title: leftTitle, style: .default) { (action) in
            
            if((leftEventHandler) != nil){
              leftEventHandler!()
            }
        }
        
        let rightAction:UIAlertAction = UIAlertAction(title: leftTitle, style: .default) { (action) in
            
            if((rightEventHandler) != nil){
                rightEventHandler!()
            }
        }
        
        
        alert.addAction(leftAction)
        alert.addAction(rightAction)
        
        self.present(alert, animated: true) {
            if((completion) != nil){
                 completion!()
            }
        }
    }
    
    
    func showSheetView(title:String?, message:String?,completion:(()->())?,actions:[(title:String,eventHandler:()->())]) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        actions.forEach { (title:String,eventHandler:(()->())?) in
            let action:UIAlertAction = UIAlertAction(title: title, style: .default) { (action) in
                
                if((eventHandler) != nil){
                    eventHandler!()
                }
                
            }
            action.setValue(UIColor.colorWithHexString(hexString: "#222222"), forKey: "_titleTextColor")
            alert.addAction(action)
        }
        
        
        let action:UIAlertAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
           
        }
        action.setValue(UIColor.colorWithHexString(hexString: "#222222"), forKey: "_titleTextColor")
        alert.addAction(action)
        
        
        self.present(alert, animated: true) {
            
            if((completion) != nil){
                completion!()
            }
            
        }

        
    }
    
    
    // runtime 扩展
    var rt_isNavigationBarHidden:Bool {
        get{
            if let value = objc_getAssociatedObject(self, &rt_navigationBarHiddenKey) as? Bool {
                return value
            }
            return false
        }
        set(newValue){
            objc_setAssociatedObject(self, &rt_navigationBarHiddenKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
   
   
    
    
    
    
}
