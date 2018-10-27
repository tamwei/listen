//
//  MineVC.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class MineVC: kViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var infoView:MineInfoView!
    var fansView:UIView!
    var menuView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        tableView.tableHeaderView = self.tableViewHeader()
        tableView.configTableView(delegate: self)
        tableView.rowHeight = 60
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "KTableViewCell")
                
        self.bindTableViewData()
        
        infoView.header.kf.setImage(with: URL(string:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg"), for: .normal)
        infoView.id.text = "ID:2017.08.11"
        infoView.title.text = "东林探花"
    }

    
    func tableViewHeader() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 242))
        header.backgroundColor = kVCBgColor
        
        let view = UIView()
        view.backgroundColor = .white
        header.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
        }
        
        infoView = MineInfoView()
        view.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(20)
            make.height.equalTo(50)
        }
        
        fansView = self.getFansView()
        view.addSubview(fansView)
        fansView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(infoView.snp.bottom).offset(20)
            make.height.equalTo(35)
            make.bottom.equalTo(-15)
        }
        
        menuView = self.getMenuView()
        menuView.backgroundColor = .white
        header.addSubview(menuView)
        menuView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(view.snp.bottom).offset(10)
        }
        
        return header
    }
    
    func getFansView() -> UIView {
        let list = [(count:"0",text:"关注"),
                    (count:"0",text:"粉丝"),
                    (count:"0",text:"访客")]
        let fansView = KSuduView.suduView(list: list,itemLineCount:3, itemHeight: 35, hSpace:1, vSpace:0, templetClass: TextSuduTemplet.self, bindData: { (element, view) in
            
            if let element = element as? (count:String,text:String),let view = view as? TextSuduTemplet {
                view.countlab?.configLab(fontSize: 12, color: .black, align: .center)
                view.titlelab?.configLab(fontSize: 12, color: .black, align: .center)
                view.countlab?.text = element.count
                view.titlelab?.text = element.text
                view.backgroundColor = .white
                
            }
        })
        
        fansView.backgroundColor = kVCBgColor

        return fansView
    }
    
    func getMenuView() ->UIView {
        let view = UIView()
        
        let menus = [(image:"wallet",text:"钱包"),
                     (image:"recharge",text:"充值"),
                     (image:"shareProfit",text:"分享赚"),
                     (image:"mineHome",text:"个人主页")]
        menuView = KSuduView.suduView(list: menus,itemLineCount:4, itemHeight: 55, hSpace:0, vSpace:0, templetClass: ImageSuduTemplet.self, bindData: { (element, view) in
            
            if let element = element as? (image:String,text:String),let view = view as? ImageSuduTemplet {
                view.titlelab?.configLab(fontSize: 12, color: .black, align: .center)
                view.imageView?.image = UIImage(named: element.image)
                view.titlelab?.text = element.text
                view.backgroundColor = .white
            }
        })
        view.addSubview(menuView)
        menuView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(15)
            make.bottom.equalTo(18)
        }
        
        view.addBottomLine(0, left: 15, right: -15)
        
        return view
    }
  
    func bindTableViewData() {
        
        typealias Listener = (header:String,name:String,info:String,sale:String,comment:String,expenses:String,autograph:String,sex:String,voice:String,sexBg:UIColor)
        
        //初始化数据
    
        let items = Observable.just([SectionModel(model: " ", items: [
            (image:"workStatus",title:"接单状态"),
            (image:"breakTime",title:"休息时间"),
            (image:"listenerSetting",title:"倾听者设置"),
            (image:"share",title:"分享给好友"),
            (image:"about",title:"关于左右倾听"),
            (image:"service",title:"在线客服"),
            (image:"question",title:"意见反馈")])])
        
        //创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource
        <SectionModel<String, (image:String,title:String)>>(
                configureCell: { (dataSource, tableView, indexPath, element) in
                    let cell = tableView.dequeueReusableCell(withIdentifier: "KTableViewCell",for: indexPath)
                    cell.imageView?.image = UIImage.init(named: element.image)
                    cell.textLabel?.text = element.title
                    cell.accessoryType = .disclosureIndicator
                    return cell
                    
            })
        
        
        //绑定单元格数据
        items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }


    

}
