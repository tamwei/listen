//
//  ExtMJRefresh.swift
//  HaoBan
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit

//对MJRefreshComponent增加rx扩展
extension Reactive where Base: MJRefreshComponent {
    
    //正在刷新事件
    var refreshing: ControlEvent<Void> {
        let source: Observable<Void> = Observable.create {
            [weak control = self.base] observer  in
            if let control = control {
                control.refreshingBlock = {
                    observer.on(.next(()))
                }
            }
            return Disposables.create()
        }
        return ControlEvent(events: source)
    }
    
    //停止刷新
    var endRefreshing: Binder<Bool> {
        return Binder(base) { refresh, isEnd in
            if isEnd {
                refresh.endRefreshing()
            }
        }
    }
}







