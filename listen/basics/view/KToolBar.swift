//
//  KTextView.swift
//  listen
//
//  Created by tw on 2018/8/2.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

enum KToolBarStyle {
    case bluePlain  // 蓝色简约版
    case blackClassics  // 黑色经典版
}


class KToolBar: UIView {
    
    private var toolBarStyle:KToolBarStyle?
    
    private var _data:[String]?
    
    var line:UIView?
    
    var selectEventHandler:((_ title:String)->())?
    var data:[String] {
        get{
            return _data!
        }
        
        set(newValue){
            _data = newValue
            
            let count:CGFloat = (CGFloat)((_data?.count)!)
            let width = KScreenWidth/count
            var lastBtn:UIButton?
            
            _data?.forEach({ (item) in
                lastBtn = self.subviews.last as? UIButton
                
                let btn = UIButton()
                btn.setTitle(item, for: .normal)
                btn.addTarget(self, action: #selector(btnDidClick(sender:)), for: .touchUpInside)
                self.addSubview(btn)

                
                if(self.toolBarStyle == .bluePlain){
                    btn.setTitleColor(UIColor.colorWithHexString(hexString: "#448CFA"), for: .normal)
                } else if(self.toolBarStyle == .blackClassics){
                    btn.setTitleColor(kSubTextColor, for: .normal)
                    btn.setTitleColor(kTitleColor, for: .selected)
                    
                }
                
                
                if(lastBtn == nil){
                    btn.snp.makeConstraints({ (make) in
                        make.width.equalTo(width)
                        make.left.top.bottom.equalTo(0)
                    })
                } else {
                    btn.snp.makeConstraints({ (make) in
                        make.width.equalTo(width)
                        make.top.bottom.equalTo(0)
                        make.left.equalTo((lastBtn?.snp.right)!)
                    })
                }
            
            })
        }
        
    }
    
    func setLineFrame(btn:UIButton) {
        line?.snp.remakeConstraints { (make) in
            make.height.equalTo(3)
            make.width.equalTo(20)
            make.bottom.equalTo(0)
            make.centerX.equalTo(btn.snp.centerX)
        }
    }
    
    init(style:KToolBarStyle) {
        super.init(frame:CGRect.zero)
        
        self.toolBarStyle = style
        
        self.backgroundColor = UIColor.white
        
        line = UIView()
        line?.backgroundColor = UIColor.colorWithHexString(hexString: "#448CFA")
        self.addSubview(line!)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func btnDidClick(sender:UIButton) {
        let subviews:[UIButton] = self.subviews.filter { (view) -> Bool in
            if(view is UIButton){
                return true
            }
            return false
        } as! [UIButton]
        
        
        subviews.forEach { (btn:UIButton) in
            btn.isSelected = false
        }
        
        sender.isSelected = true
        self.setLineFrame(btn: sender)
        
        if((self.selectEventHandler) != nil){
            self.selectEventHandler!(sender.title(for: .normal)!)
        }
    }
    
    func selectItemAtIndex(index:NSInteger)  {
        let subviews:[UIButton] = self.subviews.filter { (view) -> Bool in
            if(view is UIButton){
                return true
            }
            return false
            } as! [UIButton]
        
        let btn = subviews[index]
        btn.isSelected = true
        self.setLineFrame(btn: btn)
    }
}



