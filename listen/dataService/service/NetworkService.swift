//
//  NetworkService.swift
//  HaoBan
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import Foundation

class NetworkService {
    
    let baseUrl = ""
    
    
    func getSectionModels() -> Observable<SignInModel> {
        let urlString = "https://www.douban.com/j/app/radio/channels"
        let url = URL(string:urlString)!
        let items = requestJSON(.get,url).map { response, data -> SignInModel in
            if let json = data as? [String:Any] {
                return Mapper<SignInModel>().map(JSON: json)!
            } else {
                return Mapper<SignInModel>().map(JSON: [:])!
            }
        }
        
        return  items
        
    }
    
    
}
