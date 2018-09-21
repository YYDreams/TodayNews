//
//  TNConcernCell.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import Kingfisher
class TNConcernCell: UICollectionViewCell,RegisterCellFromNib {

    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var vipImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var concern = TNConcern(){
        
        didSet{
            
            
            headerImageView.kf.setImage(with: URL(string:(concern.icon)))
            nameLabel.text = concern.name
            vipImageView.isHidden = !concern.is_verify
            vipImageView.image = concern.user_auth_info.auth_type == 1 ? UIImage(named: "all_v_avatar_star_16x16_") : UIImage(named: "all_v_avatar_18x18_")

            
        }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
