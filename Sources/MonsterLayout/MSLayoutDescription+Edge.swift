//
//  MSLayoutDescription+Edge.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/6.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 边缘布局
extension MSLayoutDescription {
    
    /// 设置边缘填充父视图
    public static var fill: MSLayoutDescription {
        MSLayoutDescription(nil, [.top, .left, .bottom, .right])
    }
    
    /// 设置边缘填充父视图 `margin` 内的区域
    public class func fill(_ margin: MSLayoutInsetsConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.top, .left, .bottom, .right], margin)
    }
    
    /// 设置边缘填充父视图 `margin` 内的区域
    public class func fill(_ vertical: MSLayoutOffsetConstant, _ horizontal: MSLayoutOffsetConstant) -> MSLayoutDescription {
        .fill(MSLayoutInsets(top: vertical.offsetValue, left: horizontal.offsetValue, bottom: vertical.offsetValue, right: horizontal.offsetValue))
    }
    
    /// 设置边缘填充父视图 `margin` 内的区域
    public class func fill(_ top: MSLayoutOffsetConstant, _ left: MSLayoutOffsetConstant, _ bottom: MSLayoutOffsetConstant, _ right: MSLayoutOffsetConstant) -> MSLayoutDescription {
        .fill(MSLayoutInsets(top: top.offsetValue, left: left.offsetValue, bottom: bottom.offsetValue, right: right.offsetValue))
    }
    
#if canImport(UIKit)
    /// 设置边缘填充父视图 `layoutMargins` 内的区域，效果等同于 `fill(layoutMargins)`
    public static var fillMargin: MSLayoutDescription {
        MSLayoutDescription(nil, [.topMargin, .leftMargin, .bottomMargin, .rightMargin])
    }
#endif
}


/// 垂直边缘布局
extension MSLayoutDescription {
    
    /// 设置垂直方向填充父视图
    public static var fillY: MSLayoutDescription {
        MSLayoutDescription(nil, [.top, .bottom])
    }
    
    /// 设置垂直方向填充父视图 `margin` 内的区域
    public class func fillY(_ margin: MSLayoutInsetsConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.top, .bottom], margin)
    }
    
    /// 设置垂直方向填充父视图 `margin` 内的区域
    public class func fillY(_ top: MSLayoutOffsetConstant, _ bottom: MSLayoutOffsetConstant) -> MSLayoutDescription {
        .fillY(MSLayoutInsets(top: top.offsetValue, left: 0, bottom: bottom.offsetValue, right: 0))
    }
    
#if canImport(UIKit)
    /// 设置垂直边缘填充父视图 `layoutMargins` 内的区域，效果等同于 `fillY(layoutMargins)`
    public static var fillYMargin: MSLayoutDescription {
        MSLayoutDescription(nil, [.topMargin, .bottomMargin])
    }
#endif
}


/// 水平边缘布局
extension MSLayoutDescription {
    
    /// 设置水平方向填充父视图
    public static var fillX: MSLayoutDescription {
        MSLayoutDescription(nil, [.left, .right])
    }
    
    /// 设置水平方向填充父视图 `margin` 内的区域
    public class func fillX(_ margin: MSLayoutInsetsConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.left, .right], margin)
    }
    
    /// 设置水平方向填充父视图 `margin` 内的区域
    public class func fillX(_ left: MSLayoutOffsetConstant, _ right: MSLayoutOffsetConstant) -> MSLayoutDescription {
        .fillX(MSLayoutInsets(top: 0, left: left.offsetValue, bottom: 0, right: right.offsetValue))
    }
    
#if canImport(UIKit)
    /// 设置水平边缘填充父视图 `layoutMargins` 内的区域，效果等同于 `fillX(layoutMargins)`
    public static var fillXMargin: MSLayoutDescription {
        MSLayoutDescription(nil, [.leftMargin, .rightMargin])
    }
#endif
}
