//
//  MSLayout.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/29.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 轴向
public typealias MSLayoutAxis = NSLayoutConstraint.Axis


/// 当前视图的布局
public final class MSLayout {
    
    /// 当前的布局约束
    private lazy var constraints: NSMutableSet = NSMutableSet()
}


/// 添加约束
extension MSLayout {
    
    /// 添加并激活约束
    internal func active(_ constraints: [NSLayoutConstraint]) {
        // 激活约束
        NSLayoutConstraint.activate(constraints)
        // 保存约束
        self.constraints.addObjects(from: constraints)
    }
}


/// 移除约束
extension MSLayout {
    
    /// 移除指定的约束
    internal func remove(_ constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            if let result = self.constraints.first(where: {
                ($0 as! NSLayoutConstraint).firstItem === constraint.firstItem &&
                ($0 as! NSLayoutConstraint).firstAttribute == constraint.firstAttribute &&
                ($0 as! NSLayoutConstraint).secondItem === constraint.secondItem &&
                ($0 as! NSLayoutConstraint).secondAttribute == constraint.secondAttribute &&
                ($0 as! NSLayoutConstraint).constant == constraint.constant &&
                ($0 as! NSLayoutConstraint).multiplier == constraint.multiplier &&
                ($0 as! NSLayoutConstraint).priority == constraint.priority
            }) as? NSLayoutConstraint {
                // 关闭约束
                result.isActive = false
                // 移除约束
                self.constraints.remove(result)
            }
        }
    }
    
    /// 移除全部约束
    internal func remove() {
        // 让所有约束失效
        NSLayoutConstraint.deactivate(self.constraints.allObjects as! [NSLayoutConstraint])
        // 移除所有约束
        self.constraints.removeAllObjects()
    }
}


/// 更新约束
extension MSLayout {
    
    /// 更新指定的约束
    internal func update(_ constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            if let result = self.constraints.first(where: {
                ($0 as! NSLayoutConstraint).firstItem === constraint.firstItem &&
                ($0 as! NSLayoutConstraint).firstAttribute == constraint.firstAttribute &&
                ($0 as! NSLayoutConstraint).secondItem === constraint.secondItem &&
                ($0 as! NSLayoutConstraint).secondAttribute == constraint.secondAttribute &&
                ($0 as! NSLayoutConstraint).multiplier == constraint.multiplier
            }) as? NSLayoutConstraint {
                result.constant = constraint.constant
                result.priority = constraint.priority
            }
        }
    }
}






