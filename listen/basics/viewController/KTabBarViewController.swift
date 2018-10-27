//
//  KTabBarViewController.swift
//  listen
//
//  Created by tw on 2018/7/13.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

class KTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarBackgroundColor(color: .white)
        
        self.addChildViewController(getNav(className:"HomeVC", title:"首页", imageName: "tab_index", selectedImageName: "tab_index_select"))
        self.addChildViewController(getNav(className: "MessageVC", title:"消息", imageName: "tab_msg", selectedImageName: "tab_msg_select"))
        self.addChildViewController(getNav(className: "MineVC", title:"我的", imageName: "tab_mine", selectedImageName: "tab_mine_select"))
        
       
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor.colorWithHexString(hexString: "#333333");
        self.selectedIndex = 1;
        
        // Do any additional setup after loading the view.
    }
    
    func getNav(className:String,title:String,imageName:String,selectedImageName:String) -> UINavigationController {
        
        let cls:AnyClass = NSClassFromString("listen."+className)!;
        let vcCls = cls as! UIViewController.Type;
        let vc = vcCls.init();
        vc.title = title;
        let nav = KNavigationViewController.init(rootViewController: vc);
        
        let tabBarItem = UITabBarItem.init(title: title, image: (UIImage.init(named: imageName))?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: selectedImageName)?.withRenderingMode(.alwaysOriginal))
        
        nav.tabBarItem = tabBarItem
        
        
        return nav
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
