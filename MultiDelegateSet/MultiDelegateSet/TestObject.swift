//
//  TestObject.swift
//  MultiDelegateSet
//
//  Created by HongXiangWen on 2020/6/30.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation

@objc protocol TestObjectDelegate: class {
    func testCallback()
}

class TestObject {
    
    private(set) var delegateSet = MultiDelegateSet<TestObjectDelegate>()
    
    func callback() {
        delegateSet.allDelegates().forEach { $0.testCallback() }
    }
}
