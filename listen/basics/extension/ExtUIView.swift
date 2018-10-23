//
//  ExtUIView.swift
//  listen
//
//  Created by WangBC on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation
import UIKit

var rt_bottomLineKey = "bottomLineKey"

extension UIView{
    
    var rt_bottomLine : UIView {
        get{
            if let value = objc_getAssociatedObject(self, &rt_bottomLineKey) as? UIView {
                return value
            }
            
            let line = UIView()
            line.backgroundColor = UIColor.colorWithHexString(hexString: "#E8E9ED")
           
            objc_setAssociatedObject(self, &rt_bottomLineKey, line, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return line
        }
        
    }
    
    func setLayer(cornerRadius:CGFloat = 0.0,masksToBounds:Bool = false,shadowOffset:CGSize = CGSize.init(width: 0, height: 0),shadowRadius:CGFloat = 0.0,borderWidth:CGFloat = 0.0,shadowColor:UIColor! = UIColor.clear,borderColor:UIColor! = UIColor.clear,shadowOpacity:Float = 1.0){
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = masksToBounds;
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.cgColor;
        self.layer.shadowColor = shadowColor.cgColor;
        self.layer.shadowOffset = shadowOffset;
        self.layer.shadowRadius = shadowRadius;
        self.layer.shadowOpacity = shadowOpacity;
    }
    
    func gradient(frame:CGRect,startColor:UIColor=UIColor(red: 0x00/255, green: 0xcc/255, blue: 0xff/255, alpha: 1),endColor:UIColor=UIColor(red: 0x44/255, green: 0x8c/255, blue: 0xfa/255, alpha: 1),startPoint:CGPoint=CGPoint(x: 0, y: 1),endPoint:CGPoint=CGPoint(x: 1, y: 0),cornerRadius:CGFloat=5){
       
        let gradientColors = [startColor.cgColor,endColor.cgColor]
    
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.cornerRadius = cornerRadius;
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    func addBottomLine(_ bottom:Float = 0,left:Float = 0,right:Float = 0) {

        self.addSubview(rt_bottomLine)

        
        rt_bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.height.equalTo(1)
            make.bottom.equalTo(bottom)
        }
        
        
    }
    
    
    
    
    
    
   
    
}










