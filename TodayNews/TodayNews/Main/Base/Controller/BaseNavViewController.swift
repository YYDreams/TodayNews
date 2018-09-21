//
//  BaseNavViewController.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
            
        }
        

        super.pushViewController(viewController, animated: true)

    }
    
    @objc private func navigationBack(){
        
        popViewController(animated: true)
        
    }
    
    

}
