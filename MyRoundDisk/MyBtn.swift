//
//  MyBtn.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/24.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class MyBtn: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
   
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        var center = self.imageView!.center
        
        center.x = self.frame.size.width / 2
        
        center.y = self.frame.size.height / 2 - 5
        
        self.imageView!.center = center
        
        
        var frame1 = self.titleLabel!.frame
        
        frame1.origin.x = 0
        
        frame1.origin.y = self.imageView!.frame.origin.y + 5 + self.imageView!.frame.size.height
        
        frame1.size.width = self.frame.size.width
        
        self.titleLabel?.frame = frame1
        self.titleLabel?.textAlignment = .center
    }

}
