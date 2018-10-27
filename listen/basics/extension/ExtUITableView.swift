//
//  ExtUITableView.swift
//  listen
//
//  Created by tw on 2018/9/25.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UITableView {
    open class func tableView(frame:CGRect = .zero,delegate:AnyObject) -> UITableView {
       
        let tableView = UITableView(frame:frame, style: .plain)
        tableView.delegate = delegate as? UITableViewDelegate;
        tableView.dataSource = delegate as? UITableViewDataSource;
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        
        
        
        tableView.separatorStyle = .singleLine;
        tableView.separatorColor = UIColor.colorWithHexString(hexString: "EBEBEB")
        tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)



        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        return tableView
        
        
    }
    
    func configTableView(delegate:AnyObject) {
        
        self.delegate = delegate as? UITableViewDelegate;
        self.dataSource = delegate as? UITableViewDataSource;
        self.tableFooterView = UIView()
        
        self.separatorStyle = .singleLine;
        self.separatorColor = UIColor.colorWithHexString(hexString: "EBEBEB")
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
                
        
    }
    
}




