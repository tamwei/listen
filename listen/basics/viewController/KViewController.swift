//
// KViewController.swift
//  listen
//
//  Created by tw on 2018/7/13.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit


class kViewController: UIViewController,UIGestureRecognizerDelegate {
  
    public let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kVCBgColor;
        
        self.edgesForExtendedLayout = []

        let image = UIImage(named: "back")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: #selector(backBtnClick))
        
        self.navigationController?.navigationBar.tintColor = UIColor.colorWithHexString(hexString: "#222222");
        self.navigationController?.navigationBar.backIndicatorImage = UIImage();
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage();
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        
        self.navigationController?.isNavigationBarHidden = false

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let hidden = self.navigationController?.isNavigationBarHidden
        self.rt_isNavigationBarHidden = hidden!
    }
    
    
    func setRightBtn(image:UIImage) {
      
        let backImage = image.withRenderingMode(.alwaysOriginal)
        let item = UIBarButtonItem.init(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightBtnClick))
        self.navigationItem.rightBarButtonItem = item
    }
    
    
    func setRightBtn(title:String)  {
        let item:UIBarButtonItem = UIBarButtonItem.init(title: title, style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightBtnClick))
        
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func rightBtnClick(){
        
        
    }
    
    
    @objc func backBtnClick() {
        Router.popVC(animated: true)
    }

   
    deinit {
        
        DLog("-----------",self)
    }
    
}


