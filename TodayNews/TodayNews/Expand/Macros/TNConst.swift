//
//  TNConst.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


//屏幕宽度
let ScreenWidth = UIScreen.main.bounds.width

//屏幕高度
let ScreenHight = UIScreen.main.bounds.height


let device_id: Int = 6096495334

let userId: Int = 5034850950

let isIphoneX: Bool = ScreenHight == 812 ? true:false

let kNewsTitleHeight: CGFloat = 40

let kHeaderViewHeight: CGFloat = 280

let kUserDateHeaderBgImgViewHeight: CGFloat = 146

let kIsNight = "isNight"

/// 关注的用户详情界面 topTab 的按钮的宽度

let kTopTabButtonWidth: CGFloat = ScreenWidth * 0.2


/// 关注的用户详情界面 topTab 的指示条的宽度 和 高度
let kTopTabindicatorWidth: CGFloat = 40
let kTopTabindicatorHeight: CGFloat = 2


/// 动态图片的宽高
// 图片的宽高
// 1        screenWidth * 0.5
// 2        (screenWidth - 35) / 2
// 3,4,5-9    (screenWidth - 40) / 3
let image1Width: CGFloat = ScreenWidth * 0.5
let image2Width: CGFloat = (ScreenWidth - 35) * 0.5
let image3Width: CGFloat = (ScreenWidth - 40) / 3
