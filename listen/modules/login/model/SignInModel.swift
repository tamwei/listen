//
//  SignInModel.swift
//  listen
//
//  Created by tw on 2018/10/23.
//  Copyright © 2018年 listen. All rights reserved.
//

import Foundation


struct SignInModel:Mappable {
    
    var image: String!
    var name: String!
    var msg:String!
    var time:String!
    var count:String!
    var remind:String!
    var unRead:String!
    var senderStutas:String!
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        image <- map["image"]
        name <- map["name"]
        msg <- map["msg"]
        time <- map["time"]
        count <- map["count"]
        remind <- map["remind"]
        unRead <- map["unRead"]
        senderStutas <- map["senderStutas"]
    }
    
    
}
