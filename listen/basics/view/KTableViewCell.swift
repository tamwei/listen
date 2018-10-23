//
//  KTableViewCell.swift
//  listen
//
//  Created by tw on 2018/8/2.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit


class KTableViewCell: UITableViewCell {
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.colorWithHexString(hexString: "#E8EFFA")
        self.selectedBackgroundView = bgView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
