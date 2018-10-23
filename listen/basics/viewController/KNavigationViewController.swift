//
//  KNavigationViewController.swift
//  listen
//
//  Created by tw on 2018/7/13.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

class KNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationBar.backgroundColor = .white
        
        self.navigationBar.isTranslucent = false;
        
    
    }
    
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
        let vc = super.popViewController(animated: animated)
        let cvc = self.visibleViewController
        let hiden = cvc?.rt_isNavigationBarHidden
        self.setNavigationBarHidden(hiden!, animated: animated)
        return vc
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        let hiden = viewController.rt_isNavigationBarHidden
        self.setNavigationBarHidden(hiden, animated: animated)

    }
}
