//
//  CircleController.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class CircleController: BaseViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let width: CGFloat = 300
        let rect = CGRect(x: (self.view.frame.width - width) / 2, y: 64 + 20, width: width, height: width)
        let points = [0,20]
        
        
        let radian = CircleRadian(start: CGFloat(M_PI / 4 + M_PI / 2), end: CGFloat(M_PI / 4))
//        let radian = CircleRadian(start: 0, end: CGFloat(M_PI))
        
        let circleView = CircleView(frame: rect, showPoints: points, radian: radian)
        
        self.view.addSubview(circleView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    deinit {
        print("监测 CircleController 释放了-----")
    }

}
