//
//  TNUserDetailController.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/20.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class TNUserDetailController: BaseUIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

          setupSubView()
    }
    
    fileprivate lazy var  headerView: UserDetailHeaderView = {
        
        return UserDetailHeaderView.loadViewFromNib()
        
    }()
    
}

extension TNUserDetailController{
    
 fileprivate   func setupSubView()  {
    
    scrollView.addSubview(headerView)
    scrollView.contentSize = CGSize(width: ScreenWidth, height: 1000)
    scrollView.backgroundColor = UIColor.yellow
    }
}


//网络请求相关
extension TNUserDetailController{
    
    
    
    
    
    
    
}














