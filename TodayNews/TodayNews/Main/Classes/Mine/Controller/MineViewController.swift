//
//  MineViewController.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/18.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MineViewController: UITableViewController {

    var sections = [[TNMineModel]]()
    var concerns = [TNConcern]()
    private lazy var headerView = TNNotLoginHeaderView.loadViewFromNib()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupTableView()
        
        loadData { (sections) in
            
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let cocern = TNMineModel.deserialize(from: string)
            var cocerns = [TNMineModel]()
             cocerns.append(cocern!)
            self.sections.append(cocerns)
            self.sections += sections
            
            self.tableView.reloadData()
            self.loadAttentionData(completionHandler: { (concern) in
                
                self.concerns = concern
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
                
            })
            
        }
    }

    


}
extension MineViewController{
    
    private func setupTableView(){
        
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        
        tableView.hh_registerCell(cell: TNMineCell.self)
        tableView.hh_registerCell(cell: TNAttentionCell.self)

    }
    
    
}


extension MineViewController{
    
    
    
    //我的关注数据
    func loadAttentionData(completionHandler: @escaping (_ cocerns: [TNConcern])->()){
        
        let url = MAIN_URL +  kConcernFollowUrl
        
        let params = ["device_id":device_id]
        Alamofire.request(url, parameters: params).responseJSON { (respose) in
            guard respose.result.isSuccess else {return}
            
            if let value  = respose.result.value {
                
                let json = JSON(value)
                guard json["message"] == "success"  else { return }
                if let datas = json["data"].arrayObject{
                    
                    completionHandler(datas.flatMap({ TNConcern.deserialize(from: $0 as? Dictionary) }))

                }
                
                
            }
            
        }
        
        
        
    }
    func loadData(completionHandler:@escaping (_ sections: [[TNMineModel]]) -> ()){
        
        let url = MAIN_URL + kUserTabUrl
        let params = ["device_id":device_id]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard  response.result.isSuccess else {
                
                print("网络出错")
                //网络错误提示信息
                return
            }
            
            if let value = response.result.value{
                let json  = JSON(value)
                guard json["message"] == "success" else{
                    return
                }
                
                if let data = json["data"].dictionary{
                    
                    print(data)
                    
                    
//                    if let sections = data["sections"]?.array{
                    
//                        var sectionArray = [[TNMineModel]]()
//                        for item in sections {
//
//                            var rows = [TNMineModel]()
//
//                            for row in item.arrayObject!{
//
//                                let mineCellModel = TNMineModel.deserialize(from: row as? NSDictionary)
//                                rows.append(mineCellModel!)
//                            }
//
//                            sectionArray.append(rows)

//                        }
                    
//                    completionHandler(sectionArray)
                    //等价于上面
                        if let sections = data["sections"]?.arrayObject{

                            completionHandler(sections.flatMap({ item  in
                                
                                ( item as! [Any]).flatMap({ row in
                                    
                                    TNMineModel.deserialize(from: row as? NSDictionary)
                                })
                            }))
                    }
                }
            }
            print("=============")
//            print(response)
            print("=============")
            
        }
        
        
    }
    
    
}
extension MineViewController{
    
   override  func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
        
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.section == 0 && indexPath.row == 0 {
        
        return  (concerns.count == 0 || concerns.count == 1) ? 40 : 114
    }
    return 45
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        view.backgroundColor = UIColor.red
        return view
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 && indexPath.row == 1 {
            
            navigationController?.pushViewController(TNSettingViewController(), animated: true)
            
        }
        
    }
  override  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 1 ? 0 : 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section  == 0 && indexPath.row == 0 {
            let cell = tableView.hh_dequeueReusableCell(indexPath: indexPath) as TNAttentionCell
            cell.model = sections[indexPath.section][indexPath.row]
            
            cell.collectionView.isHidden = (concerns.count == 0 || concerns.count == 1)  //? true : false
            if concerns.count == 1 { cell.oneConcern = concerns[0] }
            if concerns.count > 1  {cell.concerns = concerns    }
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.hh_dequeueReusableCell(indexPath: indexPath) as TNMineCell
        let model = sections[indexPath.section][indexPath.row]
        cell.leftLabel?.text = model.text
        cell.rightLabel.text = model.grey_text
        
        return cell
        
    }

}

extension MineViewController:TNAttentionCellDeletegate{
    func TNAttentionCelldidSelectItem(_ attentionSelectedCell: TNAttentionCell, concern: TNConcern){
        
        let userDeta = TNUserDetailController()
        navigationController?.pushViewController(userDeta, animated: true)
        
        
    }

    
    
}
