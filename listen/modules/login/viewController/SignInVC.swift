//
//  SignInVC.swift
//  listen
//
//  Created by tw on 2018/10/22.
//  Copyright © 2018年 listen. All rights reserved.
//

import UIKit

class SignInVC: kViewController {

    @IBOutlet weak var phoneNO: UITextField!
    
    @IBOutlet weak var psw: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var forgetPsw: UIButton!
    
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var qq: UIButton!
    
    @IBOutlet weak var wechat: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.navigationController?.isNavigationBarHidden = true
        
        phoneNO.leftView = UIImageView(image: UIImage(named: "phoneNo"))
        phoneNO.keyboardType = .asciiCapableNumberPad

        psw.leftView = UIImageView(image: UIImage(named: "psw"))
        signIn.layer.cornerRadius = 25
        
        
       
        self.bindEvent()
       
    }
    
    func bindEvent() {
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
        
        
        signUp.rx.tap.subscribe(onNext: { _ in
            
            let vc = SignUpVC()
            Router.pushVC(vc: vc, animated: true)
            
        }).disposed(by: disposeBag)
        
        
        forgetPsw.rx.tap.subscribe(onNext: { _ in
            
            let vc = ForgetPswVC()
            Router.pushVC(vc: vc, animated: true)
            
        }).disposed(by: disposeBag)
        
        
        signIn.rx.tap.bind{
            
            Router.enter()
            
        }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
