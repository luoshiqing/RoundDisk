//
//  MyCell.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class MyCell {

    
    var title: String?
    var subTitle: String?
    
    var classtype: String
    
    init(title: String?,subTitle: String?,classTyp: String) {
        
        self.title = title
        self.subTitle = subTitle
        self.classtype = classTyp
    }
    
   
    
}


//自定义返回按钮
func creatBackBtn(target: Any?,selector: Selector,for controlEvents: UIControlEvents) ->(UIBarButtonItem,UIBarButtonItem){
    
    let leftBtn = UIButton(frame: CGRect(x: 0,y: 0,width: 13,height: 26))
    leftBtn.setImage(UIImage(named: "tmBack"), for: UIControlState())
    
    leftBtn.addTarget(target, action: selector, for: controlEvents)
    
    let backItem = UIBarButtonItem(customView: leftBtn)
    
    let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
    spacer.width = -5
    
    return (spacer,backItem)
    
}


class ClsType: NSObject {
    
    
    class func getClassType(name: String) -> UIViewController?{
        
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }

        let cls: AnyClass? = NSClassFromString((clsName as! String) + "." + name)

        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return nil
        }
        let viewCtr = clsType.init()
        return viewCtr
    }
    
  
    
}

