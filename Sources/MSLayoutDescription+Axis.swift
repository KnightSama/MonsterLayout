//
//  MSLayoutDescription+Axis.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/6.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 中心对齐
extension MSLayoutDescription {
    
    /// 与父视图中心对齐
    public static var center: MSLayoutDescription {
        MSLayoutDescription(nil, [.centerX, .centerY])
    }
    
    /// 与指定视图中心对齐
    public class func center(_ target: MSLayoutTarget) -> MSLayoutDescription {
        MSLayoutDescription(target, [.centerX, .centerY])
    }
    
#if canImport(UIKit)
    /// 与父视图 `layoutMargins` 内的区域中心对齐，效果等同于 `.center.offset(layoutMargins)`
    public static var centerMargin: MSLayoutDescription {
        MSLayoutDescription(nil, [.centerXWithinMargins, .centerYWithinMargins])
    }
#endif
}


/// 基线对齐
extension MSLayoutDescription {
    
    /// `lastBaseline` 与指定视图 `lastBaseline` 对齐
    public class func baseline(_ target: MSLayoutTarget) -> MSLayoutDescription {
        MSLayoutDescription(target, [.lastBaseline])
    }
    
    /// `lastBaseline` 与指定视图 `lastBaseline` 对齐
    public class func lastBaseline(_ target: MSLayoutTarget) -> MSLayoutDescription {
        MSLayoutDescription(target, [.lastBaseline])
    }
    
    /// `lastBaseline` 与指定视图的垂直 `anchor` 对齐
    public class func lastBaseline(_ anchor: MSLayoutAnchor.YAxis) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.lastBaseline: anchor.attribute])
    }
    
#if canImport(UIKit)
    /// `firstBaseline` 与指定视图 `firstBaseline` 对齐
    public class func firstBaseline(_ target: MSLayoutTarget) -> MSLayoutDescription {
        MSLayoutDescription(target, [.firstBaseline])
    }
    
    /// `firstBaseline` 与指定视图的垂直 `anchor` 对齐
    public class func firstBaseline(_ anchor: MSLayoutAnchor.YAxis) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.firstBaseline: anchor.attribute])
    }
#endif
}
