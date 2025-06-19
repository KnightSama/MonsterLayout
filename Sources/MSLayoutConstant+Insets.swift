//
//  MSLayoutConstant+Insets.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/30.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


#if canImport(UIKit)
    public typealias MSLayoutInsets = UIEdgeInsets
#else
    public typealias MSLayoutInsets = NSEdgeInsets
#endif


/// 布局 `Insets` 常量
public protocol MSLayoutInsetsConstant: MSLayoutConstant {}


/// 扩展 `Int` 类型
extension Int: MSLayoutInsetsConstant {}


/// 扩展 `UInt` 类型
extension UInt: MSLayoutInsetsConstant {}


/// 扩展 `Float` 类型
extension Float: MSLayoutInsetsConstant {}


/// 扩展 `Double` 类型
extension Double: MSLayoutInsetsConstant {}


/// 扩展 `CGFloat` 类型
extension CGFloat: MSLayoutInsetsConstant {}


/// 扩展 `NSDirectionalEdgeInsets`
#if canImport(UIKit)
extension NSDirectionalEdgeInsets: MSLayoutInsetsConstant {}
#endif


/// 扩展 `MSLayoutInsets`
extension MSLayoutInsets: MSLayoutInsetsConstant {
    
    /// 新增初始化方法
    internal static func insets(_ offset: CGFloat) -> MSLayoutInsets {
        MSLayoutInsets(top: offset, left: offset, bottom: offset, right: offset)
    }
}


/// 扩展 `Insets` 常量方法
extension MSLayoutInsetsConstant {
    
    /// 获取当前偏移量的值
    internal var insetsValue: MSLayoutInsets {
        if let insets = self as? MSLayoutInsets { return insets }
        if let offset = self as? Int            { return .insets(CGFloat(offset)) }
        if let offset = self as? UInt           { return .insets(CGFloat(offset)) }
        if let offset = self as? Float          { return .insets(CGFloat(offset)) }
        if let offset = self as? Double         { return .insets(CGFloat(offset)) }
        if let offset = self as? CGFloat        { return .insets(offset) }
        #if canImport(UIKit)
        if let insets = self as? NSDirectionalEdgeInsets {
            return MSLayoutInsets(top: insets.top, left: insets.leading,  bottom: insets.bottom, right: insets.trailing)
        }
        #endif
        return .zero
    }
}
