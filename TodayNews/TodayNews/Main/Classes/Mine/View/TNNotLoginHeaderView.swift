//
//  TNNotLoginHeaderView.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

import IBAnimatable
import SwiftTheme

class TNNotLoginHeaderView: UIView,NibLoadable {

    /// 背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    /// 手机按钮
    @IBOutlet weak var mobileButton: UIButton!
    /// 微信按钮
    @IBOutlet weak var wechatButton: UIButton!
    /// QQ 按钮
    @IBOutlet weak var qqButton: UIButton!
    /// 新浪按钮
    @IBOutlet weak var sinaButton: UIButton!
    /// 更多登录方式按钮
    @IBOutlet weak var moreLoginButton: AnimatableButton!
    /// 收藏按钮
    @IBOutlet weak var favoriteButton: UIButton!
    /// 历史按钮
    @IBOutlet weak var historyButton: UIButton!
    /// 日间/夜间 按钮
    @IBOutlet weak var dayOrNightButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var bottomView: UIView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        dayOrNightButton.isSelected = UserDefaults.standard.bool(forKey: kIsNight)
        
        //设置图片
        mobileButton.theme_setImage("images.loginMobileButton", forState: .normal)
        wechatButton.theme_setImage("images.loginWechatButton", forState: .normal)
        qqButton.theme_setImage("images.loginQQButton", forState: .normal)
        sinaButton.theme_setImage("images.loginSinaButton", forState: .normal)
        favoriteButton.theme_setImage("images.mineFavoriceButton", forState: .normal)
        historyButton.theme_setImage("images.mineHistoryButton", forState: .normal)
        dayOrNightButton.theme_setImage("images.dayOrNightButton", forState: .normal)
        dayOrNightButton.setTitle("夜间", for: .normal)
        dayOrNightButton.setTitle("日间", for: .selected)
        moreLoginButton.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        
        moreLoginButton.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        favoriteButton.theme_setTitleColor("colors.black", forState: .normal)
        dayOrNightButton.theme_setTitleColor("colors.black", forState: .normal)
        historyButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
        
    }
    
    /// 点击了日间 夜间按钮
    @IBAction func dayOrNightButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        //保存用户退出前设置的主题
        UserDefaults.standard.set(sender.isSelected, forKey: kIsNight)
        ZNTheme.switchNight(sender.isSelected)
        
        
        
        
 
    }
    
    
    
}
