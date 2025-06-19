//
//  MSLayoutDescription+Size.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/3.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 宽度布局
extension MSLayoutDescription {
    
    /// 设置 `width` 为指定的值
    public class func width(_ constant: MSLayoutConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.width: .notAnAttribute], constant, 1)
    }
    
    /// 设置 `width` 与指定视图属性的约束
    public class func width(_ anchor: MSLayoutAnchor.Size, _ multiplier: MSLayoutMultiplier = 1) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.width: anchor.attribute], 0, multiplier)
    }
    
    /// 设置 `width` 与指定视图 `width` 的约束
    public class func width(_ target: MSLayoutTarget, _ multiplier: MSLayoutMultiplier = 1) -> MSLayoutDescription {
        MSLayoutDescription(target, [.width], 0, multiplier)
    }
}


/// 高度布局
extension MSLayoutDescription {
    
    /// 设置 `height` 为指定的值
    public class func height(_ constant: MSLayoutConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.height: .notAnAttribute], constant, 1)
    }
    
    /// 设置 `height` 与指定视图属性的约束
    public class func height(_ anchor: MSLayoutAnchor.Size, _ multiplier: MSLayoutMultiplier = 1) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.height: anchor.attribute], 0, multiplier)
    }
    
    /// 设置 `height`  与指定视图 `height`  的约束
    public class func height(_ target: MSLayoutTarget, _ multiplier: MSLayoutMultiplier = 1) -> MSLayoutDescription {
        MSLayoutDescription(target, [.height], 0, multiplier)
    }
}


/// 大小布局
extension MSLayoutDescription {
    
    /// 设置 `size` 为指定的值
    public class func size(_ size: CGSize) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.width: .notAnAttribute, .height: .notAnAttribute], size, 1)
    }
    
    /// 设置 `size` 为指定的值
    public class func size(_ width: MSLayoutOffsetConstant, _ height: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.width: .notAnAttribute, .height: .notAnAttribute], CGSizeMake(width.offsetValue, height.offsetValue), 1)
    }
    
    /// 设置 `size` 为指定的值且宽高相等
    public class func size(_ width: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.width: .notAnAttribute, .height: .notAnAttribute], CGSizeMake(width.offsetValue, width.offsetValue), 1)
    }
    
    /// 设置 `size` 与指定视图相等
    public class func size(_ target: MSLayoutTarget, _ multiplier: MSLayoutMultiplier = 1) -> MSLayoutDescription {
        MSLayoutDescription(target, [.width, .height], 0, multiplier)
    }
}
