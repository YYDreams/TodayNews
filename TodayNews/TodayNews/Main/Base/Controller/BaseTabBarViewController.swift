//
//  BaseTabBarViewController.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers();

    }

}

extension BaseTabBarViewController{


    private func addChildViewControllers() {
        setChildViewController(MineViewController(), title: "首页", imageName: "home")
        setChildViewController(VideoViewController(), title: "西瓜视频", imageName: "video")
        setChildViewController(MineViewController(), title: "", imageName: "redpackage")
        setChildViewController(MineViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewController(MineViewController(), title: "小视频", imageName: "huoshan")
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
    }
    
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: "isNight") {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.red], for: .highlighted)
          //字体大小 默认是12   要选择.normal 类型
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .normal)
        // 添加导航控制器为 TabBarController 的子控制器
        
        addChildViewController(BaseNavViewController(rootViewController: childController))
    }
    
    /// 设置夜间控制器
    func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器
    func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
}

