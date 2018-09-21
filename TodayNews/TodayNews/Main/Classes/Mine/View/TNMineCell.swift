//
//  TNMineCell.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class TNMineCell: UITableViewCell,RegisterCellFromNib {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
