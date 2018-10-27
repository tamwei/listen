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
   
    open class func suduView(list:Array<Any>,itemLineCount:Int,itemHeight:Float,hSpace:Float,vSpace:Float,templetClass:Swift.AnyClass,bindData:(_ tupe:Any,_ view:UIView)->()) ->UIView{
       
        let suduView = UIView()
        
        let height = itemHeight
        
        list.forEach { item in
            
            let index = suduView.subviews.count
            let clas = templetClass as! UIView.Type
            
            let view = clas.init()
            suduView.addSubview(view)
            
            view.snp.makeConstraints({ (make) in
                
                if(index%itemLineCount == 0){
                    make.left.equalTo(0)
                } else {
                    let leftView = suduView.subviews[index-1]
                    make.left.equalTo(leftView.snp.right).offset(hSpace)
                    make.width.equalTo(leftView.snp.width)

                }
                
                if(index/itemLineCount == 0){
                    make.top.equalTo(0)
                } else {
                    let topview = suduView.subviews[index-itemLineCount]
                    make.top.equalTo(topview.snp.bottom).offset(vSpace)
                    make.width.equalTo(topview.snp.width)

                }
                
                if(index%itemLineCount == itemLineCount-1){
                    make.right.equalTo(0)
                }
                
                if(index/itemLineCount == list.count/itemLineCount) {
                    make.bottom.equalTo(0)
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
        
        countlab = UILabel()
        self.addSubview(countlab!)
        countlab?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
        })


        titlelab = UILabel()
        self.addSubview(titlelab!)
        titlelab?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ImageSuduTemplet: UIView {
    var imageView:UIImageView?
    
    var titlelab:UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        self.addSubview(imageView!)
        imageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
        })
        
        
        titlelab = UILabel()
        self.addSubview(titlelab!)
        titlelab?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


