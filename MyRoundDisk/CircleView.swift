
//
//  CircleView.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class CircleView: UIView {

    //显示的点，应该包括起点跟终点，默认第0个为起点，最后一个为终点
    fileprivate var showPoints = [Int]()
    //起始和结束弧度
    fileprivate var myRadian = CircleRadian()
    //frame
    fileprivate var myFrame: CGRect!
    //内圆边距
    fileprivate let outMargin: CGFloat = 20
    //外圆边距
    fileprivate let insidMargin: CGFloat = 8
    
    
    //中心点
    lazy fileprivate var arcCenter: CGPoint = {
        //设置中心点
        return CGPoint(x: self.myFrame.width / 2, y: self.myFrame.height / 2)
    }()
    //内圆的半径
    lazy fileprivate var radius: CGFloat = {
        let r: CGFloat = (self.myFrame.width - self.outMargin * 2) / 2
        return r
    }()
    //外圆的半径
    lazy fileprivate var insidRadius: CGFloat = {
        let r: CGFloat = (self.myFrame.width - self.insidMargin * 2) / 2
        return r
    }()
    
    
    //需要画多少分刻度
    lazy var calibration: Int = {
        
        if self.showPoints.isEmpty{
            return 10 * self.piecewise
        }else{
            return self.showPoints.last! * self.piecewise
        }
 
    }()
    
    
    
    
    //-------*------*-------*--------*-------*-------->
    /*
     设置的属性
    */
    //画线的宽度
    var lineWidth: CGFloat = 1
    //每个刻度的分段数
    var piecewise = 10
    
    
    
   

    
    init(frame: CGRect,showPoints: [Int],radian: CircleRadian) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.groupTableViewBackground
        
        self.myFrame = frame
        self.showPoints = showPoints
        self.myRadian = radian

        //绘制刻度
        self.drawCalibration(center: arcCenter, allCalibration: self.calibration)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        
        self.drawOutCircle()
        
//        self.drawInsidCircle()
        
    }
    
    func drawOutCircle(){
        /*
         参数解释：
         1.center: CGPoint  中心点坐标
         2.radius: CGFloat  半径
         3.startAngle: CGFloat 起始点所在弧度
         4.endAngle: CGFloat   结束点所在弧度
         5.clockwise: Bool     是否顺时针绘制
         7.画圆时，没有坐标这个概念，根据弧度来定位起始点和结束点位置。M_PI即是圆周率。画半圆即(0,M_PI),代表0到180度。全圆则是(0,M_PI*2)，代表0到360度
         */
        //画一个内圆
        let color = UIColor.red
        color.set()
        
        
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: myRadian.startRadian, endAngle: myRadian.endRadian, clockwise: true)
        
        
        
        
        
        
        circlePath.lineWidth = lineWidth
        circlePath.stroke()
    }
    func drawInsidCircle(){
        //画一个外圆
        let insidColor = UIColor.blue
        insidColor.set()
        let insidPath = UIBezierPath(arcCenter: arcCenter, radius: insidRadius, startAngle: myRadian.startRadian, endAngle: myRadian.endRadian, clockwise: false)
        insidPath.lineWidth = lineWidth
        insidPath.stroke()
    }
    
    
    //长刻度
    var longCalibration: CGFloat = 16
    //段刻度
    var shortCalibration: CGFloat = 8
    
    //MARK:画刻度
    func drawCalibration(center: CGPoint,allCalibration: Int){
        
        //线条高度
        let lineH: CGFloat = 1
        
        for index in 0...self.calibration {
            
            //计算每个刻度的弧度
            let oneF = ((M_PI * 2 - M_PI / 2) / Double(self.calibration)) * Double(index) - M_PI * 3 / 4
            
            //刻度线的宽度
            var someOneW: CGFloat = 0
            //半径
            var rradi: CGFloat = 0
            
            
            if index % piecewise == 0 {
                
                someOneW = self.longCalibration
                //与圆内部靠齐
                rradi = self.radius - someOneW / 2
                
            }else{
                someOneW = self.shortCalibration
                //与圆内部靠齐
                rradi = self.radius - someOneW / 2
            }
            
            //颜色
            var tmpColor = UIColor.red
            

            switch index {
            case 0..<39:
                tmpColor = UIColor.gray
            case 39..<68:
                tmpColor = UIColor.green
            case 68..<112:
                tmpColor = UIColor.yellow
            default:
                tmpColor = UIColor.red
            }
            
            
            
            
            let x = center.x + rradi * CGFloat(sin(oneF)) - lineH / 2
            
            let y = center.y - rradi * CGFloat(cos(oneF)) - someOneW / 2
            
            let lineView = UIView(frame: CGRect(x: x, y: y, width: lineH, height: someOneW))
            lineView.backgroundColor = tmpColor
            
            lineView.layer.shouldRasterize = true
            
            lineView.transform = CGAffineTransform(rotationAngle: CGFloat(oneF))
            
            self.addSubview(lineView)
            
            
            if index % piecewise == 0 {
                
                
                //文本框到圆心的距离（半径）
                let textR = self.radius - longCalibration - 5
                
                let labelW: CGFloat = 15
                let labelH: CGFloat = 9
                
                let labelX = center.x + textR * CGFloat(sin(oneF)) - labelW / 2
                let labelY = center.y - textR * CGFloat(cos(oneF)) - labelH / 2
                
                let label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
                
                label.backgroundColor = UIColor.clear
                
                label.textAlignment = .center
                
                label.text = "\(index / piecewise)"
                
                label.font = UIFont.systemFont(ofSize: 8)
                label.textColor = tmpColor
                
                label.transform = CGAffineTransform(rotationAngle: CGFloat(oneF))
                label.layer.shouldRasterize = true
                
                self.addSubview(label)
            }
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    

}
