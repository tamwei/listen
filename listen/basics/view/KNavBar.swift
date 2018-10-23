//
//  KNavBar.swift
//  listen
//
//  Created by tw on 2018/8/6.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

/*
 *  导航条
 *  左边默认 回退按钮 回退事件
 *
 */

class KNavBar: UIView {
    var leftBtnEventHandler:(()->(Void))?
    var rightBtnEventHandler:(()->(Void))?
    
    var title:String? {
        get{
            return tittleLab?.text
        }
        set(newValue){
            
            tittleLab?.text = newValue
        }
    }
    var textColor: UIColor? {
        get{
            return (tittleLab?.textColor)!
        }
        
        set(newValue){
            tittleLab?.textColor = newValue
            
            leftBtn?.setTitleColor(newValue, for: .normal)
            rightBtn?.setTitleColor(newValue, for: .normal)
        }
    }
    
    private var leftBtn:UIButton?
    private var tittleLab:UILabel?
    private var rightBtn:UIButton?
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }
    
    func setUpView() {
        leftBtn = UIButton()
        leftBtn?.setTitleColor(.black, for: .normal)
        leftBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        leftBtn?.addTarget(self, action: #selector(leftBtnDidClick), for: .touchUpInside)
        self.addSubview(leftBtn!)
        
        rightBtn = UIButton()
        rightBtn?.setTitleColor(.black, for: .normal)
        rightBtn?.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        rightBtn?.addTarget(self, action: #selector(rightBtnDidClick), for: .touchUpInside)
        self.addSubview(rightBtn!)
        
        tittleLab = UILabel.newLabel(fontSize: 18, color: .white, alignment: .center, text: "")
        self.addSubview(tittleLab!)
        
        leftBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.height.equalTo(20)
            make.centerY.equalTo(self)
        })
        
        rightBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.height.equalTo(20)
            make.centerY.equalTo(self)
        })
        
        tittleLab?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
            
        })
    }
    
    
    func setLeftBtn(text:String? = nil,image:UIImage? = nil,eventHandler:(()->())?) {
       
        if let img = image {
            leftBtn?.setImage(img, for: .normal)
        }
        
        if let title = text {
            leftBtn?.setTitle(title, for: .normal)
        }
        
        if let _ = text,let _ = image {
            leftBtn?.titleEdgeInsets = UIEdgeInsetsMake(0, 7, 0, 0)
            
            leftBtn?.snp.makeConstraints({ (make) in
                make.width.equalTo(100)
            })
            
        }
        self.leftBtnEventHandler = eventHandler
    }
    
     func setRightBtn(text:String? = nil,image:UIImage? = nil,eventHandler:(()->(Void))?) {
        if let img = image {
            rightBtn?.setImage(img, for: .normal)
        }
        
        if let title = text {
            rightBtn?.setTitle(title, for: .normal)
        }
        
        if let _ = text,let _ = image {
            rightBtn?.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 7)
            
            rightBtn?.snp.makeConstraints({ (make) in
                make.width.equalTo(100)
            })
            
        }

        self.rightBtnEventHandler = eventHandler
    }
    
    
    
    

    @objc private func leftBtnDidClick() {
        if((leftBtnEventHandler) != nil){
            leftBtnEventHandler!()
        } else {
            Router.popVC(animated: true)
        }
    }
    
    @objc private func rightBtnDidClick() {
        if((rightBtnEventHandler) != nil){
            rightBtnEventHandler!()
        }
    }
    
    
}
