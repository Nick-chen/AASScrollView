
//
//  ManagerTestViewController.swift
//  LTScrollView
//
//  Created by chenweiqiang on 2018/6/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import AASScrollViewManagement


class ManagerTestViewController: UIViewController,clicked {
    
    var clickedState : Bool = false
    private lazy var viewControllers: [UIViewController] = {
        let oneVc = TestTwoViewController()
        let twoVc = TestTwoViewController()
        let threeVc = TestTwoViewController()
        let fourVc = TestTwoViewController()
        return [oneVc, twoVc, threeVc, fourVc]
    }()
    
    private lazy var titles: [String] = {
        return ["热门", "精彩推荐", "科技控", "游戏"]
    }()
    
    private lazy var layout: AASLayout = {
        let layout = AASLayout()
        layout.titleViewBgColor = UIColor(r: 255, g: 239, b: 213)
        layout.titleColor = UIColor(r: 0, g: 0, b: 0)
        layout.titleSelectColor = UIColor(r: 255, g: 0, b: 0)
        layout.bottomLineColor = UIColor.red
        layout.pageBottomLineColor = UIColor(r: 230, g: 230, b: 230)
        layout.sliderWidth = 20
        //调节滑块的高 默认44
        layout.sliderHeight = 45
        layout.isNeedScale = true
        layout.titleFont = UIFont.systemFont(ofSize: 15)
        return layout
    }()
    
    private lazy var advancedManager: AASAdvancedManager = {
        let Y: CGFloat = glt_iphoneX ? 64 + 24.0 : 64.0
        
        let H: CGFloat = glt_iphoneX ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        
        let advancedManager = AASAdvancedManager(frame: CGRect(x: 0, y: Y, width: view.bounds.width, height: H), viewControllers: [TestViewController()], titles:  ["test"], currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
            let headerView = strongSelf.testLabel()
            return headerView
        })
        
        /* 设置代理 监听滚动 */
        advancedManager.delegate = self
        
        /* 设置悬停位置 */
//        advancedManager.hoverY = 64
        
        /* 点击切换滚动过程动画 */
        advancedManager.isClickScrollAnimation = true
        
        /* 代码设置滚动到第几个位置 */
        advancedManager.scrollToIndex(index: 0)
        
        return advancedManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(advancedManager)
        advancedManagerConfig()
    }
    
    deinit {
        print("ManagerTestViewController < --> deinit")
    }
    
    func tapHandle(content: String) {
        if clickedState {
            clickedState = false
            advancedManager.updateTitlesAndViewControllers(titles: ["test"], vcs: [TestViewController()], currentViewController: self, layout: layout)
            
        } else {
            clickedState = true
            advancedManager.updateTitlesAndViewControllers(titles: self.titles, vcs: self.viewControllers, currentViewController: self, layout: layout)

        }
        
        advancedManager.scrollToIndex(index: 0)
    }
    
}

extension ManagerTestViewController: AASAdvancedScrollViewDelegate {
    
    //MARK: 具体使用请参考以下
    private func advancedManagerConfig() {
        //MARK: 选中事件
        advancedManager.advancedDidSelectIndexHandle = {
            print("选中了 -> \($0)")
        }
        
    }
    
    func glt_scrollViewOffsetY(_ offsetY: CGFloat) {
        //        print("offset --> ", offsetY)
    }
}


extension ManagerTestViewController {
    private func testLabel() -> TestHeaderView {
        
        let view = TestHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        view.delegate = self as clicked
        return view
    }
}

