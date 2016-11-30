//
//  RootController.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit

class RootController: UIViewController {

    
    fileprivate var myTabView: UITableView?
    
    let cellArray = [MyCell(title: "画圆", subTitle: "包含刻度尺", classTyp: "CircleController"),
                     MyCell(title: "Test", subTitle: "随便搞的", classTyp: "TestViewController")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "首页"
        self.view.backgroundColor = UIColor.white
        
        
        self.setTabView()

        

        
    }
    
    func setTabView(){
        
        let rect = self.view.bounds
        
        self.myTabView = UITableView(frame: rect, style: .plain)
        self.myTabView?.delegate = self
        self.myTabView?.dataSource = self
        
        self.myTabView?.tableFooterView = UIView()
        
        self.view.addSubview(self.myTabView!)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


extension RootController : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify = "MyCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identify)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identify)
        }
        
        cell?.accessoryType = .disclosureIndicator
        
        let clsCell = self.cellArray[indexPath.row]
        
                
        cell?.textLabel?.text = clsCell.title
        cell?.detailTextLabel?.text = clsCell.subTitle
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let myCell = self.cellArray[indexPath.row]
        
        if let ctr = ClsType.getClassType(name: myCell.classtype){
            
            ctr.navigationItem.title = myCell.title
            self.navigationController?.pushViewController(ctr, animated: true)
            
        }
        
 
    }
    
    
}








