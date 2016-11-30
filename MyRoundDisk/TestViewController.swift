//
//  TestViewController.swift
//  MyRoundDisk
//
//  Created by sqluo on 2016/11/22.
//  Copyright © 2016年 sqluo. All rights reserved.
//

import UIKit



struct Person {
    var name: String
    var age: Int
    var weight: Double
}


class Test {
    public var name: String
    public var age: Int
    public var weight: Double
    
    
    public var xx: Person = Person(name: "???", age: 111111, weight: 11222222)
    
    
    fileprivate var minxo: String = "xx00"
    
    init(name: String,age: Int,weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
    
    public var xo : String {

        get{
            return self.minxo
        }
        
        set(new){
            self.minxo = new
        }

    }
    
    
    
}


protocol MyProt: NSObjectProtocol {
    func test(name: String)
}
class PatyB {

    weak var delegate: MyProt?

    var name: String
    
    init(name: String) {
        self.name = name
    }

    func getName(){
        
        self.delegate?.test(name: self.name + "逗比")
        
    }
    
    
}


class TestViewController: BaseViewController ,MyProt {
    //代理
    func test(name: String) {
        print(name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
//        let btn = UIButton(type: .custom)
//        btn.setTitle("哈哈哈", for: UIControlState())
//        btn.frame = CGRect(x: 50, y: 100, width: 100, height: 60)
//        
////        btn.setBackgroundImage(UIImage(named: "rizhiAdd"), for: UIControlState())
//        
//        btn.backgroundColor = UIColor.red
//
//        btn.setImage(UIImage(named: "rizhiAdd"), for: UIControlState())
//        
//        btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: -5, bottom: -20, right: 5)
//        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
//        
//        self.view.addSubview(btn)
        
        
        
        let bt = MyBtn(frame: CGRect(x: 50, y: 100, width: 100, height: 60))
        bt.setTitle("哈哈哈", for: UIControlState())
        bt.setImage(UIImage(named: "rizhiAdd"), for: UIControlState())
        bt.backgroundColor = UIColor.red
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(bt)
        
        
        
        
        
        
        
        
        
        let patyB = PatyB(name: "哈哈哈")
        patyB.delegate = self
        
        patyB.getName()
        

        let array = ["a","b","c","b"]
        let tmpArray =  self.arrayRemoveRepeat(array: array)
        print(tmpArray)
        
    }
    
    func arrayRemoveRepeat(array: [String]) -> [String]{
        
        var tmpArray = [String]()
        
        for item in array {
            
            if !tmpArray.contains(item) {
                tmpArray.append(item)
            }
        }

        return tmpArray
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func anyConvertDic(form: Any) -> [String:Any]{
        
        var dic = [String : Any]()
        
        for childer in Mirror(reflecting: form).children {
            
            
            dic[childer.label!] = childer.value
            
        }
        
        return dic
        
    }
    
    
    
    

    
    
    deinit {
        print("监测 TestViewController 释放了-----")
    }
}
