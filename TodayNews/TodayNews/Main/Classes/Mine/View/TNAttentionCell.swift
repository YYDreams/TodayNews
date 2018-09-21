//
//  ZNAttentionCell.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

protocol TNAttentionCellDeletegate: class {
    
    func TNAttentionCelldidSelectItem(_ attentionSelectedCell: TNAttentionCell, concern: TNConcern)
}


class TNAttentionCell: BaseCell,RegisterCellFromNib {

  weak  var delegate: TNAttentionCellDeletegate?
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var concerns = [TNConcern](){
        
        didSet{
            collectionView.reloadData()
        }
    }

    /// 当只关注一个用户的时候，需要设置
    var oneConcern = TNConcern() {
        didSet {
            
        }
    }
    
    var model = TNMineModel(){
        didSet{
            
            leftLabel.text = model.text
            
            
        }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
     let   layout =  UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 80)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource  = self
        collectionView.hh_registerCell(cell: TNConcernCell.self)

        
        
        
    }

}

extension TNAttentionCell: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return concerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.hh_dequeueReusableCell(indexPath: indexPath) as TNConcernCell
        cell.concern = concerns[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let concern  = concerns[indexPath.item]
        
     delegate?.TNAttentionCelldidSelectItem(self, concern: concern)
        
    }
    
}





