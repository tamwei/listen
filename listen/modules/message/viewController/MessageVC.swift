//
//  MessageVC.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class MessageVC: kViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        tableView.configTableView(delegate: self)
        tableView.rowHeight = 70
        tableView.register(MessageCell.self, forCellReuseIdentifier: "MessageCell")
        
        self.bindTableViewData()
    }

    func bindTableViewData() {
        
        typealias Message = (header:String,name:String,mesage:String,time:String,count:String)
        
        //初始化数据
        
        let items = Observable.just([SectionModel(model: " ", items: [
            (header:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg",name:"东林探花",mesage:"不要等到你学会爱的时候，别人早已消失…",time:"2017.08.11",count:"2"),
            (header:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg",name:"东林探花",mesage:"不要等到你学会爱的时候，别人早已消失…",time:"2017.08.11",count:"99+"),
            (header:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg",name:"东林探花",mesage:"不要等到你学会爱的时候，别人早已消失…",time:"2017.08.11",count:"0")
           
            ])])
        
        //创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource
            <SectionModel<String, Message>>(
                configureCell: { (dataSource, tableView, indexPath, element) in
                    let cell:MessageCell = tableView.dequeueReusableCell(withIdentifier: "MessageCell",for: indexPath) as! MessageCell
                    
                    cell.header.kf.setImage(with: URL(string: element.header), for: .normal)
                    cell.name.text = element.name
                    cell.message.text = element.mesage
                    cell.time.text = element.time
                    cell.count.text = element.count
                
                    return cell
                    
            })
        
        
        //绑定单元格数据
        items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

  

}
