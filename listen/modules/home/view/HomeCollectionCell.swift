//
//  HomeCollectionCell.swift
//  listen
//
//  Created by tw on 2018/10/24.
//  Copyright © 2018 listen. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    private(set) var img:UIImageView!
    
    private(set) var lab:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = .white
        
        img = UIImageView()
        self.addSubview(img)
        
        lab = UILabel.label(fontSize: 10, color: colorHex(hexString:"#666666"), alignment: .left)
        self.addSubview(lab)
    
        img.snp.makeConstraints { (make) in
            make.top.equalTo(13)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        lab.snp.makeConstraints { (make) in
            make.bottom.equalTo(-11)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}


