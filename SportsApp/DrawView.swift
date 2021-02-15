//
//  DrawView.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/11/20.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit

class DrawView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let rectangle1 = UIBezierPath(rect: CGRect(x: 120, y: 180, width: 400, height: 400))
        let rectangle2 = UIBezierPath(rect: CGRect(x: 520, y: 180, width: 400, height: 400))
        
        // 内側の色
        UIColor(red: 1, green: 0.5, blue: 0, alpha: 0.3).setFill()
        // 内側を塗りつぶす
        rectangle1.fill()
        
        // 線の色
        UIColor(red: 1, green: 0.5, blue: 0, alpha: 1.0).setStroke()
        // 線の太さ
        rectangle1.lineWidth = 2.0
        // 線を塗りつぶす
        rectangle1.stroke()
        
        // 内側の色
        UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.3).setFill()
        // 内側を塗りつぶす
        rectangle2.fill()
               
        // 線の色
        UIColor(red: 0, green: 0.5, blue: 1, alpha: 1.0).setStroke()
        // 線の太さ
        rectangle2.lineWidth = 2.0
        // 線を塗りつぶす
        rectangle2.stroke()
    }

}
