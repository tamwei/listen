//
//  Router.swift
//  HaoBan
//
//  Created by tw on 2018/7/18.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

class Router: NSObject {
    
   static private var _tabVC:UITabBarController? = nil
   static private var _navVC:UINavigationController? = nil

    
    // MARK: public
   static var tabVC:UITabBarController? {
        get{
            if(_tabVC == nil ){
                _tabVC = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController;
            }
            
            return _tabVC
        }

    }

   static var navVC:UINavigationController {
        get{
            
            if (self.tabVC == nil){
                _navVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            } else{
                _navVC = self.tabVC?.selectedViewController as? UINavigationController
            }
            
            return _navVC!
        }
    }
    
    
   static var currentVC:UIViewController {
    
    let vc:UIViewController = self.navVC.visibleViewController!
    return vc;
    
    }
    
    static var currentVCs:Array<UIViewController> {
        
        let vcs:Array = self.navVC.viewControllers
        
        return vcs;
    }
    

    
    
    // MARK: public Methord
   static func pushVC(vc:UIViewController , animated:Bool) -> Void {
    
      vc.hidesBottomBarWhenPushed = true
      self.navVC.pushViewController(vc, animated: animated)

    }
    
    static func popVC (animated:Bool) -> Void {
      self.navVC.popViewController(animated: animated)
        if(self.navVC.viewControllers.count==1){
            self.currentVC.hidesBottomBarWhenPushed = false
        }
        
    }
    
    
    open class func enter()  {
        let tVC = KTabBarViewController()
        UIApplication.shared.keyWindow?.rootViewController = tVC
    }
    
    
    
}
