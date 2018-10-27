//
//  HomeVC.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class HomeVC: kViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collecttion: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        let width = (KScreenWidth-4)/5
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: width, height: 75)
        
        collecttion.collectionViewLayout = flowLayout
        collecttion.backgroundColor = colorHex(hexString: "#F2F2F2")
        collecttion.register(HomeCollectionCell.self,
                                     forCellWithReuseIdentifier: "HomeCollectionCell")
        self.view.addSubview(collecttion)

        
        tableView.configTableView(delegate: self)
        tableView.sectionHeaderHeight = 10
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        self.bindCollectionViewData()
        
        self.bindTableViewData()
        
        
    }
    
    func bindCollectionViewData() {
        //初始化数据
        let items = Observable.just([
            SectionModel(model: "", items: [
                (img:"home_collect_1",text:"情感问题"),
                (img:"home_collect_2",text:"两性关系"),
                (img:"home_collect_3",text:"同性恋"),
                (img:"home_collect_4",text:"抑郁症"),
                (img:"home_collect_5",text:"失眠"),
                (img:"home_collect_6",text:"家庭教育"),
                (img:"home_collect_7",text:"学业问题"),
                (img:"home_collect_8",text:"人际关系"),
                (img:"home_collect_9",text:"婚姻关系"),
                (img:"home_collect_10",text:"失恋陪护")])
            ])
        
        //创建数据源
        let dataSource = RxCollectionViewSectionedReloadDataSource
            <SectionModel<String, (img:String,text:String)>>(
                configureCell: { (dataSource, collectionView, indexPath, element) in
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell",
                                                                  for: indexPath) as! HomeCollectionCell
                    cell.img.image = UIImage(named: element.img)
                    cell.lab.text = element.text
                    return cell
            })
      
        
        //绑定单元格数据
        items
            .bind(to: collecttion.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    func bindTableViewData() {
       
        typealias Listener = (header:String,name:String,info:String,sale:String,comment:String,expenses:String,autograph:String,sex:String,voice:String,sexBg:UIColor)
        
        //初始化数据
        
        let mode1 = SectionModel(model: " ", items: [
            (header:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg",name:"东林探路",info:"医务人员 | 有对象 | 博士 | 天秤",sale:"月售 121.5小时",comment:"收到934条评价>",expenses:"¥3/分钟",autograph:"不要等到你学会爱的时候，别人早已消失在茫茫人海。",sex:"男 38",voice:"voice_man",sexBg:colorHex(hexString: "#5AC8FB"))])
        
        let mode2 = SectionModel(model: " ", items: [
            (header:"https://b-ssl.duitang.com/uploads/item/201505/24/20150524223721_aSeZQ.thumb.700_0.jpeg",name:"东林探路",info:"医务人员 | 有对象 | 博士 | 天秤",sale:"月售 121.5小时",comment:"收到934条评价>",expenses:"¥3/分钟",autograph:"不要等到你学会爱的时候，别人早已消失在茫茫人海。",sex:"男 38",voice:"voice",sexBg:colorHex(hexString: "#FE332D"))])
        
        let items = Observable.just([mode1,mode2])
        
        //创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource
            <SectionModel<String, Listener>>(
                configureCell: { (dataSource, tableView, indexPath, element) in
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell",
                                                                  for: indexPath) as! HomeTableViewCell
                   
                    
                    cell.header.kf.setImage(with: URL(string: element.header), for: .normal)
                    cell.voice.setImage(UIImage(named: element.voice), for: .normal)
                    cell.name.text = element.name
                    cell.sex.text = element.sex
                    cell.sex.backgroundColor = element.sexBg
                    cell.info.text = element.info
                    cell.sale.text = element.sale
                    cell.comment.text = element.comment
                    cell.expenses.text = element.expenses
//                    cell.autograph
                    
                    return cell
                    
            },titleForHeaderInSection:{ds, section in
                return ds[section].model
            })
   
        
        //绑定单元格数据
        items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
