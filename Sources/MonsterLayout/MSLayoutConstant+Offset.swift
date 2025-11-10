//
//  MSLayoutConstant+Offset.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/30.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 布局 `Offset` 常量
public protocol MSLayoutOffsetConstant: MSLayoutConstant {}


/// 扩展 `Int` 类型
extension Int: MSLayoutOffsetConstant {}


/// 扩展 `UInt` 类型
extension UInt: MSLayoutOffsetConstant {}


/// 扩展 `Float` 类型
extension Float: MSLayoutOffsetConstant {}


/// 扩展 `Double` 类型
extension Double: MSLayoutOffsetConstant {}


/// 扩展 `CGFloat` 类型
extension CGFloat: MSLayoutOffsetConstant {}


/// 扩展 `Offset` 常量方法
extension MSLayoutOffsetConstant {
    
    /// 获取当前偏移量的值
    internal var offsetValue: CGFloat {
        if let offset = self as? Int     { return CGFloat(offset) }
        if let offset = self as? UInt    { return CGFloat(offset) }
        if let offset = self as? Float   { return CGFloat(offset) }
        if let offset = self as? Double  { return CGFloat(offset) }
        if let offset = self as? CGFloat { return CGFloat(offset) }
        return 0
    }
}


