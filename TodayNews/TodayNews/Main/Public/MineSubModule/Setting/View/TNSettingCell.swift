//
//  TNSettingCell.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import Kingfisher

class TNSettingCell: BaseCell,RegisterCellFromNib {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBOutlet weak var subTitleLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    @IBOutlet weak var settingSwitch: UISwitch!
    
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    
    var settingModel = TNSettingModel(){
        
        didSet{
            
            titleLabel.text = settingModel.title
            subTitleLabel.text = settingModel.subTitle
            rightLabel.text =  settingModel.rightTitle
            arrowImageView.isHidden = settingModel.isHiddenRightArraw
            settingSwitch.isHidden = settingModel.isHiddenSwitch
            if  !settingModel.isHiddenSubtitle {

                subTitleLabelHeight.constant = 20
                layoutIfNeeded()

            }
            
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
extension TNSettingCell{
    
    //清除缓存
    func clearCacheAlert(){
        
        
        let alertController = UIAlertController(title: "确定清除所有缓存？问答草稿、离线下载及图片均会被清除", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: { (_) in
            let cache = KingfisherManager.shared.cache
            cache.clearDiskCache()
            cache.clearMemoryCache()
            cache.cleanExpiredDiskCache()
            self.rightLabel.text = "0.00M"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    //从沙盒中获取缓存数据的大小
    func calculateDiskCashSize(){
        
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            //转换成M
            let sizeM = Double(size) / 1024.0 / 1024.0
            self.rightLabel.text = String(format:"%.2fM",sizeM)
            
            
        }
        
    }
    //设置字体大小
    func setupFontSizeAlert(){
        
        let alertController = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .default, handler: { (_) in
            self.rightLabel.text = "小"
        })
        let middleAction = UIAlertAction(title: "中", style: .default, handler: { (_) in
            self.rightLabel.text = "中"
        })
        let bigAction = UIAlertAction(title: "大", style: .default, handler: { (_) in
            self.rightLabel.text = "大"
        })
        let largeAction = UIAlertAction(title: "特大", style: .default, handler: { (_) in
            self.rightLabel.text = "特大"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(smallAction)
        alertController.addAction(middleAction)
        alertController.addAction(bigAction)
        alertController.addAction(largeAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        
        
    }
    /// 非 WiFi 网络流量
    func setupNetworkAlert() {
        let alertController = UIAlertController(title: "非 WiFi 网络流量", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let bestAction = UIAlertAction(title: "最小效果(下载大图)", style: .default, handler: { (_) in
            self.rightLabel.text = "最小效果(下载大图)"
        })
        let betterAction = UIAlertAction(title: "较省流量(智能下图)", style: .default, handler: { (_) in
            self.rightLabel.text = "较省流量(智能下图)"
        })
        let leastAction = UIAlertAction(title: "极省流量(智能下图)", style: .default, handler: { (_) in
            self.rightLabel.text = "极省流量(智能下图)"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(bestAction)
        alertController.addAction(betterAction)
        alertController.addAction(leastAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
   
    /// 非 WiFi 网络播放提醒
    func setupPlayNoticeAlert() {
        let alertController = UIAlertController(title: "非 WiFi 网络播放提醒", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let everyAction = UIAlertAction(title: "每次提醒", style: .default, handler: { (_) in
            self.rightLabel.text = "每次提醒"
        })
        let onceAction = UIAlertAction(title: "提醒一次", style: .default, handler: { (_) in
            self.rightLabel.text = "提醒一次"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(everyAction)
        alertController.addAction(onceAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    
}





