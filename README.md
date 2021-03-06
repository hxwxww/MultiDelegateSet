# MultiDelegateSet

### 核心思想

通过`NSHashTable`来管理代理集合，通过设置`options`为`.weakMemory`来保证代理在销毁时自动移除集合中的对象。

### 具体实现

```
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
```

### 使用方法

`TestObject`类：
```
@objc protocol TestObjectDelegate: class {
    func testCallback()
}

class TestObject {
    
    private(set) var delegateSet = MultiDelegateSet<TestObjectDelegate>()
    
    func callback() {
        delegateSet.allDelegates().forEach { $0.testCallback() }
    }
}
```
添加代理：
```
testObject.delegateSet.addDelegate(self)
```
