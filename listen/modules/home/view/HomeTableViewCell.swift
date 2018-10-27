//
//  HomeTableViewCell.swift
//  listen
//
//  Created by tw on 2018/10/24.
//  Copyright © 2018 listen. All rights reserved.
//

import UIKit

class HomeTableViewCell: KTableViewCell {
    
    private(set) var header:UIButton!
    private(set) var voice:UIButton!
    private(set) var name:UILabel!
    private(set) var sex:UILabel!
    private(set) var info:UILabel!
    private(set) var sale:UILabel!
    private(set) var comment:UILabel!
    private(set) var expenses:UILabel!
    private(set) var autograph:UIView!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        self.setUpView()
        self.makeConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
        self.makeConstraints()
    }
    
    func setUpView() {
        header = UIButton()
        header.layer.cornerRadius = 25
        header.layer.masksToBounds = true
        self.addSubview(header)
        
        voice = UIButton()
        self.addSubview(voice)
        
        name = UILabel.label(fontSize: 14, color: kTitleColor, alignment: .left)
        self.addSubview(name)
        
        sex = UILabel.label(fontSize: 8, color: .white, alignment: .left)
        sex.layer.cornerRadius = 2
        self.addSubview(sex)
        
        info = UILabel.label(fontSize: 10, color: kTextColor, alignment: .left)
        self.addSubview(info)
        
        sale = UILabel.label(fontSize: 10, color: kTextColor, alignment: .left)
        self.addSubview(sale)
        
        comment = UILabel.label(fontSize: 10, color: kTextColor, alignment: .left)
        self.addSubview(comment)
        
        expenses = UILabel.label(fontSize: 12, color: colorHex(hexString: "#FE332D"), alignment: .right)
        self.addSubview(expenses)
        
        autograph = UIView()
        self.addSubview(autograph)
        
    }
    
    func makeConstraints() {
        header.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.width.height.equalTo(50)
        }
        
        voice.snp.makeConstraints { (make) in
            make.centerY.equalTo(header.snp.top)
            make.right.equalTo(header.snp.right).offset(5)
            make.width.height.equalTo(20)
        }
        
        name.snp.makeConstraints { (make) in
            make.left.equalTo(header.snp.right).offset(10)
            make.top.equalTo(header.snp.top)
            make.height.equalTo(17)
        }
        
        sex.snp.makeConstraints { (make) in
            make.centerY.equalTo(name.snp.centerY)
            make.left.equalTo(name.snp.right)
            make.width.equalTo(25)
        }
        
        info.snp.makeConstraints { (make) in
            make.left.equalTo(name.snp.left)
            make.height.equalTo(12)
            make.top.equalTo(name.snp.bottom).offset(5)
        }
        
        sale.snp.makeConstraints { (make) in
            make.left.equalTo(name.snp.left)
            make.height.equalTo(12)
            make.top.equalTo(info.snp.bottom).offset(5)
        }
        
        comment.snp.makeConstraints { (make) in
            make.left.equalTo(sale.snp.right).offset(10)
            make.height.equalTo(12)
            make.top.equalTo(info.snp.bottom).offset(5)
        }
        
        expenses.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(16)
        }
        
        autograph.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-10)
        }
    }
}
