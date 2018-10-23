//
//  LocalService.swift
//  HaoBan
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation
import ObjectMapper

class LocalService {
    
    func getRandomResult() -> Observable<SignInModel> {
        
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        let data = NSData.init(contentsOfFile: path!)
        
        let tmp:Any = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
        
        
       
        let items = { () -> SignInModel in
            if let json = tmp as? [String:Any] {
            
              let result = Mapper<SignInModel>().map(JSON: json)
                return result!
                
            }else {
                return Mapper<SignInModel>().map(JSON: [:])!
            }
        }()
        
        let observable = Observable.just(items)
        return observable
    }
}



