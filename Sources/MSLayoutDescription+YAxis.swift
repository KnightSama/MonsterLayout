//
//  MSLayoutDescription+YAxis.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/6.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 顶部对齐
extension MSLayoutDescription {
    
    /// 设置顶部与父视图对齐
    public static var top: MSLayoutDescription {
        MSLayoutDescription(nil, [.top])
    }
    
    /// 设置顶部与父视图对齐
    public class func top(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.top], offset)
    }
    
    /// 设置顶部与指定视图顶部对齐
    public class func top(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.top], offset)
    }
    
    /// 设置顶部与指定视图垂直方向锚点对齐
    public class func top(_ anchor: MSLayoutAnchor.YAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.top: anchor.attribute], offset)
    }
}


/// 中心对齐
extension MSLayoutDescription {
    
    /// 设置中心垂直方向与父视图对齐
    public static var centerY: MSLayoutDescription {
        MSLayoutDescription(nil, [.centerY])
    }
    
    /// 设置中心垂直方向与父视图对齐
    public class func centerY(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.centerY], offset)
    }
    
    /// 设置中心垂直方向与指定视图中心垂直方向对齐
    public class func centerY(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.centerY], offset)
    }
    
    /// 设置中心垂直方向与指定视图垂直方向锚点对齐
    public class func centerY(_ anchor: MSLayoutAnchor.YAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.centerY: anchor.attribute], offset)
    }
}


/// 底部对齐
extension MSLayoutDescription {
    
    /// 设置底部与父视图对齐
    public static var bottom: MSLayoutDescription {
        MSLayoutDescription(nil, [.bottom])
    }
    
    /// 设置底部与父视图对齐
    public class func bottom(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.bottom], offset)
    }
    
    /// 设置底部与指定视图底部对齐
    public class func bottom(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.bottom], offset)
    }
    
    /// 设置底部与指定视图垂直方向锚点对齐
    public class func bottom(_ anchor: MSLayoutAnchor.YAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.bottom: anchor.attribute], offset)
    }
}


