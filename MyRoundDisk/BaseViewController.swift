//
//  BaseViewController.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let (Rspacer,RbackItem) = creatBackBtn(target: self, selector: #selector(self.backBtnAct(send:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItems = [Rspacer,RbackItem]
        
    }
    
    func backBtnAct(send: UIButton){
        self.navigationController!.popViewController(animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
