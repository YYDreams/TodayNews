//
//  TNSettingViewController.swift
//  TodayNews
//
//  Created by flowerflower on 2018/9/19.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class TNSettingViewController: BaseTableViewController {

    var sections = [[TNSettingModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "设置"
        loadData()
        setupTableView()

    }
    fileprivate func setupTableView(){
        tableView.rowHeight = 44
        tableView.hh_registerCell(cell: TNSettingCell.self)
        
    }
  
    fileprivate func loadData(){
        
        
        
        let path = Bundle.main.path(forResource: "Setting", ofType: "plist")
        let pathFileArr = NSArray(contentsOfFile: path!) as! [Any]
        
//        for dic in pathFileArr {
//
//            let array = dic as! [[String: Any]]
//
//            var row = [TNSettingModel]()
//
//            for dict in array {
//                let setting = TNSettingModel.deserialize(from: dict as NSDictionary)
//                row.append(setting!)
//            }
//            sections.append(row)
//
//        }
        
        
     sections = pathFileArr.flatMap({ section in
            
        (section as! [Any]).flatMap({ row in

            TNSettingModel.deserialize(from: row as? NSDictionary)
        })
            
        })
        

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        view.backgroundColor  = UIColor.red
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 10: 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.hh_dequeueReusableCell(indexPath: indexPath) as TNSettingCell
          cell.settingModel = sections[indexPath.section][indexPath.row]
        return cell
    }
    
  override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    let cell  = tableView.cellForRow(at: indexPath) as! TNSettingCell
    switch indexPath.section {
    case 0:
        switch indexPath.row{
        case 0: cell.clearCacheAlert() //清除缓存
        case 1: cell.setupFontSizeAlert() //设置字体大小
        case 2: cell.setupNetworkAlert() // 非 WiFi 网络流量
        case 3: cell.setupPlayNoticeAlert() //非 WiFi 网络播放提醒
        default: break
 
        }
    case 1:
        if indexPath.row == 0 {  // 离线下载
            navigationController?.pushViewController(TNOfflineDownloadController(), animated: true)
        }
   
    default:break
    
    }
    }

}
