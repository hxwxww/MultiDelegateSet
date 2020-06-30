//
//  MultiDelegateSet.swift
//  MultiDelegateSet
//
//  Created by HongXiangWen on 2020/6/30.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation

struct MultiDelegateSet<T: AnyObject> {
    
    /// 代理集合
    private (set) var delegates = NSHashTable<T>(options: .weakMemory)
    
    /// 添加代理
    ///
    /// - Parameter delegate: 代理
    func addDelegate(_ delegate: T) {
        if !delegates.contains(delegate) {
            delegates.add(delegate)
        }
    }
    
    /// 移除代理
    ///
    /// - Parameter delegate: 代理
    func removeDelegate(_ delegate: T) {
        if delegates.contains(delegate) {
            delegates.remove(delegate)
        }
    }
    
    /// 获取所有代理数组
    ///
    /// - Returns: 代理数组
    func allDelegates() -> [T] {
        return delegates.allObjects
    }
}
