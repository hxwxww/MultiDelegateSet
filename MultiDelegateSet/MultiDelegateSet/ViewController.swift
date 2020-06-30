//
//  ViewController.swift
//  MultiDelegateSet
//
//  Created by HongXiangWen on 2020/6/30.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TestObjectDelegate {
    
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
}

