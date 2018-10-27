//
//  MessageCell.swift
//  listen
//
//  Created by tw on 2018/10/27.
//  Copyright © 2018 listen. All rights reserved.
//

import UIKit

class MessageCell: KTableViewCell {
    
    var header:UIButton!
    var name:UILabel!
    var message:UILabel!
    var time:UILabel!
    var count:UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView() {
        header = UIButton()
        header.layer.cornerRadius = 20
        header.layer.masksToBounds = true
        self.addSubview(header)
        
        name = UILabel.label(fontSize: 12, color: kTitleColor, alignment: .left)
        self.addSubview(name)
        
        message = UILabel.label(fontSize: 14, color: kTextColor, alignment: .left)
        self.addSubview(message)
        
        time = UILabel.label(fontSize: 8, color: kTitleColor, alignment: .right)
        self.addSubview(time)
        
        count = UILabel.label(fontSize: 10, color: .white, alignment: .center)
        count.layer.cornerRadius = 7
        count.layer.masksToBounds = true
        count.backgroundColor = .red
        self.addSubview(count)

        header.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(header.snp.height)

        }
        
        name.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.top)
            make.left.equalTo(header.snp.right).offset(10)
        }
        
        message.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.left.equalTo(name.snp.left)
        }
        
        time.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.top.equalTo(name.snp.top)
        }
        
        count.snp.makeConstraints { (make) in
            make.centerY.equalTo(message.snp.centerY)
            make.right.equalTo(time.snp.right)
            make.height.equalTo(14)
            make.width.greaterThanOrEqualTo(14)
        }
    }
}
