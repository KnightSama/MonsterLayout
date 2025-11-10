//
//  MSLayoutMultiplier.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/30.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 倍率
public protocol MSLayoutMultiplier {
    
    /// 转换为 `CGFloat`
    var multiplierValue: CGFloat { get }
}


/// 扩展 `Int` 类型
extension Int: MSLayoutMultiplier {
    
    public var multiplierValue: CGFloat { CGFloat(self) }
}


/// 扩展 `UInt` 类型
extension UInt: MSLayoutMultiplier {
    
    public var multiplierValue: CGFloat { CGFloat(self) }
}


/// 扩展 `Float` 类型
extension Float: MSLayoutMultiplier {
    
    public var multiplierValue: CGFloat { CGFloat(self) }
}


/// 扩展 `Double` 类型
extension Double: MSLayoutMultiplier {
    
    public var multiplierValue: CGFloat { CGFloat(self) }
}


/// 扩展 `CGFloat` 类型
extension CGFloat: MSLayoutMultiplier {
    
    public var multiplierValue: CGFloat { self }
}
