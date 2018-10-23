//
//  ForgetPswVC.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class ForgetPswVC: kViewController {

    @IBOutlet weak var nav: KNavBar!
    
    @IBOutlet weak var phoneNO: KTextField!
    
    @IBOutlet weak var validate: KTextField!
    
    @IBOutlet weak var psw: KTextField!
    
    @IBOutlet weak var changePsw: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        nav.setLeftBtn(text: "忘记密码",image: UIImage(named: "back")) { () -> () in
            Router.popVC(animated: true)
        }
        
        
        phoneNO.leftView = UIImageView(image: UIImage(named: "phoneNo"))
        phoneNO.keyboardType = .asciiCapableNumberPad
        
        let btn = UIButton.button(title: "发送验证码", color: UIColor.colorWithHexString(hexString: "#3574FA"), font: UIFont.systemFont(ofSize: 14))
        btn.frame = CGRect(x: 0, y: 0, width: 100, height:52 )
        btn.rx.tap.bind {_ in
            CountDown.countDown(60, btn: btn)
            }.disposed(by: disposeBag)
        
        validate.leftView = UIImageView(image: UIImage(named: "validate"))
        validate.rightView = btn
        validate.rightViewMode = .always
        validate.keyboardType = .asciiCapableNumberPad
        
        psw.leftView = UIImageView(image: UIImage(named: "psw"))
        
        changePsw.layer.cornerRadius = 25
        
        
        phoneNO.rx.controlEvent(.editingChanged).bind {[weak self] _ in
            
            var str = self?.phoneNO.text
            if(str?.count == 4 || str?.count == 9){
                str?.append(" ")
            }
            
            if let subStr = str?.prefix(13) {
                let text:String = String(subStr)
                self?.phoneNO.text = text
            }
            
        }.disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

 

}
