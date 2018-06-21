//
//  TestViewController.swift
//  LTScrollView_Example
//
//  Created by chenweiqiang on 2018/6/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
import AASScrollViewManagement


class TestViewController: UIViewController, AASTableViewProtocal {

    private lazy var tableView: UITableView = {
        print(UIScreen.main.bounds.height)
        let H: CGFloat = glt_iphoneX ? (view.bounds.height - 64 - 24 - 34) : view.bounds.height  - 64
        let tableView = tableViewConfig(CGRect(x: 0, y: 0, width: view.bounds.width, height: H), self, self, nil)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        glt_scrollView = tableView
        reftreshData()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TestViewController {
    
    fileprivate func reftreshData()  {
        
        tableView.mj_footer = MJRefreshBackNormalFooter {[weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                print("上拉加载更多数据")
                self?.tableView.mj_footer.endRefreshing()
            })
        }
        tableView.mj_header = MJRefreshNormalHeader {[weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                print("下拉刷新 --- 1")
                self?.tableView.mj_header.endRefreshing()
            })
        }
        
    }
}


extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellWithTableView(tableView)
        cell.textLabel?.text = "testvc-第 \(indexPath.row + 1) 行"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("点击了testvc-第\(indexPath.row + 1)行")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
