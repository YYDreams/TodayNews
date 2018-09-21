//
//  AppDelegate.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SwiftTheme
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        //
        ThemeManager.setTheme(plistName: UserDefaults.standard.bool(forKey: kIsNight) ? "night_theme" : "default_theme", path: .mainBundle)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = BaseTabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
        
    }

    


}

