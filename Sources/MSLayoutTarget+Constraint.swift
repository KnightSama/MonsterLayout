//
//  MSLayoutTarget+Constraint.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/3.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


private var MSLayoutKey: UInt8 = 0


/// 当前布局
extension MSLayoutTarget {
    
    /// 获取当前视图的布局
    internal var layout: MSLayout {
        if let layout = objc_getAssociatedObject(self, &MSLayoutKey) as? MSLayout {
            return layout
        }
        let layout = MSLayout()
        objc_setAssociatedObject(self, &MSLayoutKey, layout, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return layout
    }
}


/// 布局方法
extension MSLayoutTarget {
    
    /// 布局前准备
    internal func prepare() {
        if let view = self as? MSLayoutView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}


/// 新增约束
extension MSLayoutTarget {
    
    /// 添加约束
    public func append(_ descriptions: MSLayoutDescription...) { append(descriptions) }
    
    /// 添加约束
    internal func append(_ descriptions: [MSLayoutDescription]) {
        // 布局准备
        prepare()
        // 依次生成约束
        let constraints = descriptions.flatMap { $0.constraints(for: self) }
        // 激活约束
        layout.active(constraints)
    }
}


/// 重置约束
extension MSLayoutTarget {
    
    /// 重置约束
    public func remake(_ descriptions: MSLayoutDescription...) { remake(descriptions) }
    
    /// 重置约束
    internal func remake(_ descriptions: [MSLayoutDescription]) {
        // 移除原有的约束
        layout.remove()
        // 添加约束
        append(descriptions)
    }
}


/// 更新约束
extension MSLayoutTarget {
    
    /// 更新约束
    public func update(_ descriptions: MSLayoutDescription...) { update(descriptions) }
    
    /// 更新约束
    internal func update(_ descriptions: [MSLayoutDescription]) {
        layout.update(descriptions.flatMap({ $0.constraints(for: self) }))
    }
}


/// 移除约束
extension MSLayoutTarget {
    
    /// 移除约束
    public func remove(_ descriptions: MSLayoutDescription...) { remove(descriptions) }
    
    /// 移除约束
    internal func remove(_ descriptions: [MSLayoutDescription]) {
        layout.remove(descriptions.flatMap({ $0.constraints(for: self) }))
    }
}


/// 替换约束
extension MSLayoutTarget {
    
    /// 替换约束
    public func replace(_ oldValue: MSLayoutDescription, by newValue: MSLayoutDescription...) { replace([oldValue], by: newValue) }
    
    /// 替换约束
    public func replace(_ oldValue: [MSLayoutDescription], by newValue: MSLayoutDescription...) { replace(oldValue, by: newValue) }
     
    /// 替换约束
    internal func replace(_ oldValue: [MSLayoutDescription], by newValue: [MSLayoutDescription]) {
        remove(oldValue)
        append(newValue)
    }
}

