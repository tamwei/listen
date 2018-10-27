//
//  MineInfoView.swift
//  listen
//
//  Created by tw on 2018/10/27.
//  Copyright © 2018 listen. All rights reserved.
//

import UIKit

class MineInfoView: UIView {
    
    var id:UILabel!
    var header:UIButton!
    var title:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel.label(fontSize: 22, color: kTitleColor, alignment: .left)
        self.addSubview(title)
        
        id = UILabel.label(fontSize: 10, color: kTextColor, alignment: .left)
        self.addSubview(id)
        
        header = UIButton()
        header.layer.cornerRadius = 25
        header.layer.masksToBounds = true
        self.addSubview(header)
        
        title.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(2)
            
        }
        
        id.snp.makeConstraints { (make) in
            make.left.equalTo(title.snp.left)
            make.bottom.equalTo(-4)
        }
        
        header.snp.makeConstraints { (make) in
            make.right.equalTo(-25)
            make.top.bottom.equalTo(0)
            make.width.equalTo(header.snp.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
