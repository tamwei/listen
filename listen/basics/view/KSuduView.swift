//
//  KSuduView.swift
//  listen
//
//  Created by tw on 2018/10/9.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

// 九宫格

class KSuduView: UIView {
   
    
    
    open class func suduView(list:Array<Any>,itemHeight:Float,topOffset:Float,bottomOffset:Float,templetClass:Swift.AnyClass,bindData:(_ tupe:Any,_ view:UIView)->()) ->UIView{
       
        let suduView = UIView()
        
        let height = itemHeight
        
        list.forEach { item in
            
            let index = suduView.subviews.count
            let clas = templetClass as! UIView.Type
            
            let view = clas.init()
            view.backgroundColor = UIColor.colorWithHexString(hexString: "#F7F8FB")
            suduView.addSubview(view)
            
            view.snp.makeConstraints({ (make) in
                
                
                if(index%3 == 0){
                    make.left.equalTo(0)
                } else {
                    let leftView = suduView.subviews[index-1]
                    make.left.equalTo(leftView.snp.right).offset(5)
                    make.width.equalTo(leftView.snp.width)

                }
                
                if(index/3 == 0){
                    make.top.equalTo(topOffset)
                } else {
                    let topview = suduView.subviews[index-3]
                    make.top.equalTo(topview.snp.bottom).offset(10)
                    make.width.equalTo(topview.snp.width)

                }
                
                if(index%3 == 2){
                    make.right.equalTo(0)
                }
                
                if(index/3 == list.count/3) {
                    make.bottom.equalTo(-bottomOffset)
                }
                
                make.height.equalTo(height)
                
            })
            
            bindData(item,view)
      }
        
      
        
        return suduView
    }
    
}


// 文字九宫格模板
class TextSuduTemplet: UIView {
    var countlab:UILabel?
    
    var titlelab:UILabel?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        countlab = UILabel.newLabel(fontSize: 20, color: kTitleColor, alignment: .center, text: "")
        self.addSubview(countlab!)
        countlab?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(self.snp.centerX)
        })


        titlelab = UILabel.newLabel(fontSize: 13, color: kTitleColor, alignment: .center, text: "")
        self.addSubview(titlelab!)
        titlelab?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(-10)
            make.centerX.equalTo(self.snp.centerX)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



