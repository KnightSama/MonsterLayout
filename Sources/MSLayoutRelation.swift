//
//  MSLayoutRelation.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/29.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 布局关系
public enum MSLayoutRelation {
    
    /// 等同于 `NSLayoutConstraint.Relation` 中的 `.lessThanOrEqual`
    case less
    
    /// 等同于 `NSLayoutConstraint.Relation` 中的 `.equal`
    case equal
    
    /// 等同于 `NSLayoutConstraint.Relation` 中的 `.greaterThanOrEqual`
    case great
}


/// 转换
extension MSLayoutRelation {
    
    /// 替换为 `NSLayoutConstraint.Relation`
    public var origin: NSLayoutConstraint.Relation {
        switch self {
        case .less:  return .lessThanOrEqual
        case .equal: return .equal
        case .great: return .greaterThanOrEqual
        }
    }
}
