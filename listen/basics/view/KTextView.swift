//
//  KTextView.swift
//  listen
//
//  Created by tw on 2018/10/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

class KTextView: UIView {
    public let disposeBag = DisposeBag()
    
    private(set) var placeholderLab:UILabel?
    
    private(set) var textView:UITextView?
    
    private(set) var count:UILabel?
    
    var maxLength:Int = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textView = UITextView()
        textView?.backgroundColor = kVCBgColor
        textView?.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(textView!)
        
        placeholderLab = UILabel.label(fontSize: 17, color: kTipTextColor, alignment: .left)
        placeholderLab?.text = "点击输入文字"
        self.addSubview(placeholderLab!)
        
        count = UILabel.label(fontSize: 12, color: kTipTextColor, alignment: .left)
        count?.text = "0/80"
        self.addSubview(count!)
        
        textView?.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 10, 0))
        }
        
        placeholderLab?.snp.makeConstraints { (make) in
            make.left.equalTo(3)
            make.top.equalTo(8)
        }
        
        count?.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(-8)
            
        }
        
//        textView?.rx.didBeginEditing.bind{ [weak self] in
//           self?.placeholderLab?.isHidden = true
//        }.disposed(by: disposeBag)

        
        textView?.rx.didChange.bind{ [weak self] in
            let text = self?.textView?.text
            let count = text?.count
            
            if(count!>0){
                self?.placeholderLab?.isHidden = true
            }else {
                self?.placeholderLab?.isHidden = false
            }
            
            if(count!>(self?.maxLength)!) {
                
                let index = (text?.startIndex)!

                let endIndex = text!.index((text?.endIndex)!, offsetBy:((self?.maxLength)!-count!))

                self?.textView?.text = String(text![index..<endIndex])
            }
        }.disposed(by: disposeBag)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return textView!.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        return textView!.resignFirstResponder()
    }
    
    
    
}
