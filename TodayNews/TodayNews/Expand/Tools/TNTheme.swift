//
//  TNTheme.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/20.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SwiftTheme

enum ZNTheme: Int {
    case day = 0
    case night = 1
    
    static var before = ZNTheme.day
    static var current = ZNTheme.day
    
     //选择主题
    static func switchTo (_ theme: ZNTheme){
        before = current
        current = theme
        
        switch theme {
        case .day: ThemeManager.setTheme(plistName:"default_theme", path:.mainBundle)
            
        case .night: ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
            
        }
    }
 
    //选择了夜间模式
    static func  switchNight(_ isToNight: Bool){
        
        switchTo(isToNight ? .night : .day)
        
    }
    
    //判断当前是不是夜间模式
    static func isNight() -> Bool{
        return current == .night
    }
    
}
