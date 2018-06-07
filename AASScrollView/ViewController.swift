//
//  ViewController.swift
//  AASScrollView
//
//  Created by chenweiqiang on 2018/6/7.
//  Copyright © 2018年 AS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let advance :UIViewController = LTAdvancedManagerDemo() as UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(origin: self.view.center, size: CGSize.init(width: 200, height: 50))
        button.setTitle("click", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.backgroundColor = UIColor.cyan
        
        self.view.addSubview(button)
        
    }
    
    @objc func buttonClicked() {
    
//        navigationController?.pushViewController(advance, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

