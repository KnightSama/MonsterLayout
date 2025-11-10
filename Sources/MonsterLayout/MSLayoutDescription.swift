//
//  MSLayoutDescription.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/26.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 约束描述
final public class MSLayoutDescription {
    
    /// 布局目标
    internal var target: MSLayoutTarget? = nil
    
    /// 布局属性
    internal var attributes: [MSLayoutAttribute: MSLayoutAttribute] = [:]
    
    /// 布局关系
    internal var relation: MSLayoutRelation = .equal
    
    /// 倍率
    internal var multiplier: MSLayoutMultiplier = 1
    
    /// 常量值
    internal var constant: MSLayoutConstant = 0
    
    /// 优先级
    internal var priority: MSLayoutPriority = .required
}


/// 初始化
extension MSLayoutDescription {
    
    /// 初始化
    convenience init(_ target:     MSLayoutTarget?,
                     _ attributes: [MSLayoutAttribute: MSLayoutAttribute],
                     _ constant:   MSLayoutConstant = 0,
                     _ multiplier: MSLayoutMultiplier = 1,
                     _ relation:   MSLayoutRelation = .equal,
                     _ priority:   MSLayoutPriority = .required) {
        self.init()
        self.target = target
        self.attributes = attributes
        self.multiplier = multiplier
        self.constant = constant
        self.relation = relation
        self.priority = priority
    }
    
    /// 初始化
    convenience init(_ target:     MSLayoutTarget?,
                     _ attributes: [MSLayoutAttribute],
                     _ constant:   MSLayoutConstant = 0,
                     _ multiplier: MSLayoutMultiplier = 1,
                     _ relation:   MSLayoutRelation = .equal,
                     _ priority:   MSLayoutPriority = .required) {
        self.init(target, attributes.reduce(into: Dictionary(), { $0[$1] = $1 }), constant, multiplier, relation, priority)
    }
}


/// 变更属性方法
extension MSLayoutDescription {
    
    /// 更改乘以数量
    public func multiplier(_ value: MSLayoutMultiplier) -> MSLayoutDescription {
        self.multiplier = value
        return self
    }
    
    /// 更改除以数量
    public func divideBy(_ value: MSLayoutMultiplier) -> MSLayoutDescription { multiplier(1.0 / value.multiplierValue) }
    
    /// 更改偏移量
    public func offset(_ value: MSLayoutConstant) -> MSLayoutDescription {
        self.constant = value
        return self
    }
    
    /// 更改布局关系
    public func relation(_ value: MSLayoutRelation) -> MSLayoutDescription {
        self.relation = value
        return self
    }
    
    /// 更改约束优先级
    public func priority(_ value: MSLayoutPriority) -> MSLayoutDescription {
        self.priority = value
        return self
    }
}


/// 快速变更关系属性
extension MSLayoutDescription {
    
    /// 更改布局关系为 `lessThanOrEqual`
    public var less: MSLayoutDescription { self.relation(.less) }
    
    /// 更改布局关系为 `equal`
    public var equal: MSLayoutDescription { self.relation(.equal) }
    
    /// 更改布局关系为 `greaterThanOrEqual`
    public var greater: MSLayoutDescription { self.relation(.great) }
}


/// 快速变更优先级属性
extension MSLayoutDescription {
    
    /// 更改优先级关系为 `require`
    public var require: MSLayoutDescription { self.priority(.required) }
    
    /// 更改优先级关系为 `high`
    public var high: MSLayoutDescription { self.priority(.high) }
    
    /// 更改优先级关系为 `medium`
    public var medium: MSLayoutDescription { self.priority(.medium) }
    
    /// 更改优先级关系为 `low`
    public var low: MSLayoutDescription { self.priority(.low) }
}


/// 生成系统约束
extension MSLayoutDescription {
    
    /// 生成系统约束
    internal func constraints(for item: MSLayoutTarget) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for firstAttribute in attributes.keys {
            let lastAttribute = attributes[firstAttribute] ?? .notAnAttribute
            let constraint = NSLayoutConstraint(
                item: item,
                attribute: firstAttribute,
                relatedBy: relation.origin,
                toItem: target ?? (lastAttribute == .notAnAttribute ? nil : item.owner),
                attribute: lastAttribute,
                multiplier: multiplier.multiplierValue,
                constant: constant.constantValue(for: firstAttribute)
            )
            constraint.priority = priority.origin
            constraints.append(constraint)
        }
        return constraints
    }
}




