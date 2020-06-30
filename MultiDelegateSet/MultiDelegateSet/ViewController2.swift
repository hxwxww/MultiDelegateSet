//
//  ViewController2.swift
//  MultiDelegateSet
//
//  Created by HongXiangWen on 2020/6/30.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, TestObjectDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testObject.delegateSet.addDelegate(self)
    }
    
    deinit {
        print("deinit: \(self)")
    }
      
    func testCallback() {
        print("testCallback: \(self)")
    }
    
    @IBAction func callback(_ sender: Any) {
        testObject.callback()
    }
    
    @IBAction func refresh(_ sender: Any) {
        navigationItem.title = "代理数：\(testObject.delegateSet.allDelegates().count)"
    }
}
