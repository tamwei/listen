//
//  MineFansView.swift
//  listen
//
//  Created by tw on 2018/10/27.
//  Copyright © 2018 listen. All rights reserved.
//

import UIKit

class MineFansView: UIView {
    
    var flow:UILabel!
    
    var fans:UILabel!
    
    var visitor:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        flow = UILabel.label(fontSize: 12, color: .black, alignment: .center)
        self.addSubview(flow)
        
        fans = UILabel.label(fontSize: 12, color: .black, alignment: .center)
        self.addSubview(fans)
        
        visitor = UILabel.label(fontSize: 12, color: .black, alignment: .center)
        self.addSubview(visitor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    func itemView() -> UIView {
        let view = UIView()
        
        
        return view
    }
    
}
