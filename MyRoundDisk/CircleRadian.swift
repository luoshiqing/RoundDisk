//
//  CircleRadian.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

//起始和终点
class CircleRadian {
    
    var startRadian: CGFloat = 0
    var endRadian: CGFloat = 360
 
    init() {
        
    }
    
    init(start: CGFloat,end: CGFloat) {
        
        self.startRadian = start
        self.endRadian = end
    }
    
    
}
