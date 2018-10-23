//
//  AgreementView.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class AgreementView: UIView {
    
    public let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        let iconbtn = UIButton.button(title: "同意", color: UIColor.colorWithHexString(hexString: "#999999"), font: UIFont.systemFont(ofSize: 14))
        iconbtn.setImage(UIImage(named: "disAgreemen"), for: .normal)
        iconbtn.setImage(UIImage(named: "agreemen"), for: .selected)
        iconbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        self.addSubview(iconbtn)
        iconbtn.rx.tap.bind {
            iconbtn.isSelected = !iconbtn.isSelected
        }.disposed(by: disposeBag)
        
        let btn = UIButton.button(title: "《左右倾听用户协议》", color: UIColor.colorWithHexString(hexString: "#3574FA"), font: UIFont.systemFont(ofSize: 14))
        self.addSubview(btn)
        
        
        iconbtn.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(55)
            make.height.equalTo(self.snp.height)
        }
        
        btn.snp.makeConstraints { (make) in
            make.left.equalTo(iconbtn.snp.right)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(self.snp.height)

        }
        
    }
    
    
}
