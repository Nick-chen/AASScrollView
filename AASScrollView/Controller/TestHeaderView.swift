//
//  LTHeaderView.swift
//  LTScrollView
//
//  Created by chenweiqiang on 2018/6/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class TestHeaderView: UIView {
    
    public var delegate: clicked?
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "点击响应事件"
        label.textColor = UIColor.white
        label.frame.origin.y = 30
        label.frame.origin.x = 50
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:))))
        label.backgroundColor = UIColor.gray
        label.sizeToFit()
        return label
    }()
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer)  {
        print("tapLabel☄")
        
        if self.delegate != nil {
            self.delegate!.tapHandle(content: "tap")
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 暂用，待优化。
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for tempView in self.subviews {
            if tempView.isKind(of: UILabel.self) {
                let button = tempView as! UILabel
                let newPoint = self.convert(point, to: button)
                if button.bounds.contains(newPoint) {
                    return true
                }
            }
        }
        return false
    }
}

protocol clicked {
    func tapHandle(content:String)
}

