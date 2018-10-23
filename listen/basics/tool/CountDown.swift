//
//  countDwon.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import Foundation

class CountDown: NSObject {
    class func countDown(_ timeOut: Int, btn: UIButton){
        //倒计时时间
        var timeout = timeOut
        let queue:DispatchQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        let _timer:DispatchSource = DispatchSource.makeTimerSource(flags: [], queue: queue) as! DispatchSource
        _timer.schedule(wallDeadline: DispatchWallTime.now(), repeating: .seconds(1))
        //每秒执行
        _timer.setEventHandler(handler: { () -> Void in
            if(timeout<=0){ //倒计时结束，关闭
                _timer.cancel();
                DispatchQueue.main.sync(execute: { () -> Void in
                    btn.setTitle("重新获取", for: UIControlState())
                    btn.isEnabled = true
                })
            }else{//正在倒计时
                let seconds = timeout
                let strTime = NSString.localizedStringWithFormat("%.2d", seconds)
                DispatchQueue.main.sync(execute: { () -> Void in
                    btn.isEnabled = false
                    btn.setTitle(strTime as String, for: UIControlState())

                })
                timeout -= 1;
            }
        })
        _timer.resume()
    }
}

