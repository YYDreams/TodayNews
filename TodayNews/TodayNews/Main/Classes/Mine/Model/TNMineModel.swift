//
//  TNMineModel.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import Foundation
import HandyJSON
// 我的列表
struct TNMineModel: HandyJSON {
    
    
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
    
}


//我的关注
struct TNConcern: HandyJSON {
    
    var name: String = ""
    var url: String = ""
    var total_count: Int = 0
    var description: String = ""
    var time: String = ""
    var type: String = ""
    var icon: String = ""
    var userid: Int = 0
    var is_verify: Bool = false
    var media_id: Int = 0
    var tips: Bool = false
    var id: Int = 0
        var user_auth_info = UserAuthInfo()
//    var user_auth_info: String?
//    var userAuthInfo:UserAuthInfo?{
//        return UserAuthInfo.deserialize(from: user_auth_info)
//    }
    
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int = 0
    var auth_info: String = ""
}
