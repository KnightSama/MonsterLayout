//
//  MSLayoutDescription+XAxis.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/6.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 左侧对齐
extension MSLayoutDescription {
    
    /// 设置与父视图对齐
    public static var left: MSLayoutDescription {
        MSLayoutDescription(nil, [.left])
    }
    
    /// 设置与父视图对齐
    public class func left(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.left], offset)
    }
    
    /// 设置与指定视图左侧对齐
    public class func left(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.left], offset)
    }
    
    /// 设置左侧与指定视图水平方向锚点对齐
    public class func left(_ anchor: MSLayoutAnchor.XAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.left: anchor.attribute], offset)
    }
}


/// `leading` 对齐
extension MSLayoutDescription {
    
    /// 设置与父视图对齐
    public static var leading: MSLayoutDescription {
        MSLayoutDescription(nil, [.leading])
    }
    
    /// 设置与父视图对齐
    public class func leading(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.leading], offset)
    }
    
    /// 设置与指定视图 `leading` 对齐
    public class func leading(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.leading], offset)
    }
    
    /// 设置 `leading` 与指定视图水平方向锚点对齐
    public class func leading(_ anchor: MSLayoutAnchor.XAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.leading: anchor.attribute], offset)
    }
}


/// 中心对齐
extension MSLayoutDescription {
    
    /// 设置中心水平方向与父视图对齐
    public static var centerX: MSLayoutDescription {
        MSLayoutDescription(nil, [.centerX])
    }
    
    /// 设置中心水平方向与父视图对齐
    public class func centerX(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.centerX], offset)
    }
    
    /// 设置中心水平方向与指定视图中心水平方向对齐
    public class func centerX(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.centerX], offset)
    }
    
    /// 设置中心水平方向与指定视图水平方向锚点对齐
    public class func centerX(_ anchor: MSLayoutAnchor.XAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.centerX: anchor.attribute], offset)
    }
}


/// 右侧对齐
extension MSLayoutDescription {
    
    /// 设置与父视图对齐
    public static var right: MSLayoutDescription {
        MSLayoutDescription(nil, [.right])
    }
    
    /// 设置与父视图对齐
    public class func right(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.right], offset)
    }
    
    /// 设置与指定视图右侧对齐
    public class func right(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.right], offset)
    }
    
    /// 设置右侧与指定视图水平方向锚点对齐
    public class func right(_ anchor: MSLayoutAnchor.XAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.right: anchor.attribute], offset)
    }
}


/// `trailing` 对齐
extension MSLayoutDescription {
    
    /// 设置与父视图对齐
    public static var trailing: MSLayoutDescription {
        MSLayoutDescription(nil, [.trailing])
    }
    
    /// 设置与父视图对齐
    public class func trailing(_ offset: MSLayoutOffsetConstant) -> MSLayoutDescription {
        MSLayoutDescription(nil, [.trailing], offset)
    }
    
    /// 设置与指定视图 `trailing` 对齐
    public class func trailing(_ target: MSLayoutTarget, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(target, [.trailing], offset)
    }
    
    /// 设置 `trailing` 与指定视图水平方向锚点对齐
    public class func trailing(_ anchor: MSLayoutAnchor.XAxis, _ offset: MSLayoutOffsetConstant = 0) -> MSLayoutDescription {
        MSLayoutDescription(anchor.target, [.trailing: anchor.attribute], offset)
    }
}
