//
//  ViewController.swift
//  CWActionSheetDemo
//
//  Created by chenwei on 2017/8/28.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit
import CWActionSheet

class ViewController: UITableViewController {

    var demoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoList = ["默认样式", "无title", "多行title", "无取消按钮", "动态添加", "多个按钮"]
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(red:0.94, green:0.96, blue:0.98, alpha:1.00)
    }

    // MARK: TabelViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = demoList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 取消按钮 index = 0
        let clickedHandler = { (sheetView: ActionSheetView, index: Int) in
            print("点击\(index)")
        }
        
        switch indexPath.row {
        case 1:
            let otherButtonTitles = ["设置朋友圈权限", "投诉"]
            let actionSheet = ActionSheetView(cancelButtonTitle: "取消",
                                              otherButtonTitles: otherButtonTitles,
                                              clickedHandler: clickedHandler)
            actionSheet.show()
            
        case 2:
            let title = "查看的号码 这是一条测试数据 可能是一个电话号码，您可以进行以下操作"
            let actionSheet = ActionSheetView(title: title,
                                              cancelButtonTitle: "取消",
                                              otherButtonTitles: ["呼叫", "复制号码", "添加到手机通讯录"],
                                              clickedHandler: clickedHandler)
            actionSheet.titleFont = UIFont.systemFont(ofSize: 18)
            actionSheet.show()
            
        case 3:
            let title = "这是一条提示"
            let actionSheet = ActionSheetView(title: title,
                                              otherButtonTitles: ["确定","稍等"],
                                              clickedHandler: clickedHandler)
            actionSheet.show()
    
        case 4:
            let title = "这是一条提示,过2秒会添加两条"
            let actionSheet = ActionSheetView(title: title,
                                              cancelButtonTitle: "取消",
                                              otherButtonTitles: ["确定","稍等"],
                                              clickedHandler: clickedHandler)
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                //actionSheet.insert(buttonTitles: ["测试按钮1", "测试按钮2"], at: 0)
                actionSheet.append(buttonTitles: ["测试按钮1", "测试按钮2"])
            })
            actionSheet.show()
            
        case 5:
            let title = "这是一条多个按钮"
            let otherButtonTitles = ["确定", "稍等", "测试按钮1", "测试按钮2", "测试按钮3"]
            let actionSheet = ActionSheetView(title: title,
                                              cancelButtonTitle: "取消",
                                              otherButtonTitles:otherButtonTitles,
                                              clickedHandler: clickedHandler)
            actionSheet.isScrollEnabled = true
            actionSheet.visibleButtonCount = 2.5
            actionSheet.show()
            
            
        default:
            let title = "删除后，将清空该群聊的消息记录"
            let actionSheet = ActionSheetView(title: title,
                                              cancelButtonTitle: "取消",
                                              otherButtonTitles: ["删除"],
                                              clickedHandler: clickedHandler)
            actionSheet.destructiveButtonIndex = 0
            actionSheet.show()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

