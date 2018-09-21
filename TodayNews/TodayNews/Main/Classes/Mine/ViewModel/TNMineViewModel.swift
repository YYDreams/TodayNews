//
//  TNMineViewModel.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TNMineViewModel: NSObject {

    
    
    //我的关注数据
    func loadAttentionData(completionHandler: @escaping (_ cocerns: [TNConcern])->()){
        
        let url = MAIN_URL +  kConcernFollowUrl
        
        let params = ["device_id":device_id]
        Alamofire.request(url, parameters: params).responseJSON { (respose) in
            guard respose.result.isSuccess else {return}
            
            if let value  = respose.result.value {
                
                let json = JSON(value)
                guard json["message"] == "success"  else { return }
                if let datas = json["data"].arrayObject{
                    
                    completionHandler(datas.flatMap({ TNConcern.deserialize(from: $0 as? Dictionary) }))
                    
                }
                
                
            }
            
        }
        
        
        
    }
    
    
    
}


