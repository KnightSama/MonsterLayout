//
//  MSLayoutAnchor.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/4.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 属性
public typealias MSLayoutAttribute = NSLayoutConstraint.Attribute


/// 属性
public class MSLayoutAnchor {
    
    /// 当前视图
    internal weak var target: MSLayoutTarget?
    
    /// 当前属性
    internal var attribute: MSLayoutAttribute = .notAnAttribute
    
    /// 初始化
    internal convenience init(_ target: MSLayoutTarget?, _ attribute: MSLayoutAttribute) {
        self.init()
        self.target = target
        self.attribute = attribute
    }
}


/// 宽高相关属性
extension MSLayoutAnchor {
    
    /// 宽高相关属性
    final public class Size: MSLayoutAnchor {
        
        /// 高度
        public class func height(_ target: MSLayoutTarget) -> Self { Self(target, .height) }
        
        /// 宽度
        public class func width(_ target: MSLayoutTarget) -> Self { Self(target, .width) }
    }
    
    /// 垂直方向相关属性
    final public class YAxis: MSLayoutAnchor {}
    
    /// 水平方向相关属性
    final public class XAxis: MSLayoutAnchor {}
}


/// 垂直相关锚点属性
extension MSLayoutAnchor.YAxis {
    
    /// 顶部
    public class func top(_ target: MSLayoutTarget) -> Self { Self(target, .top) }
    
    /// 底部
    public class func bottom(_ target: MSLayoutTarget) -> Self { Self(target, .bottom) }
    
    /// 中心
    public class func centerY(_ target: MSLayoutTarget) -> Self { Self(target, .centerY) }
    
    /// 基线
    public class func lastBaseline(_ target: MSLayoutTarget) -> Self { Self(target, .lastBaseline) }
}


#if canImport(UIKit)
/// 垂直相关锚点属性
extension MSLayoutAnchor.YAxis {
    
    /// 顶部
    public class func topMargin(_ target: MSLayoutTarget) -> Self { Self(target, .topMargin) }
    
    /// 底部
    public class func bottomMargin(_ target: MSLayoutTarget) -> Self { Self(target, .bottomMargin) }
    
    /// 中心
    public class func centerYMargin(_ target: MSLayoutTarget) -> Self { Self(target, .centerYWithinMargins) }
    
    /// 基线
    public class func firstBaseline(_ target: MSLayoutTarget) -> Self { Self(target, .firstBaseline) }
}
#endif


/// 水平相关锚点属性
extension MSLayoutAnchor.XAxis {
    
    /// 左侧
    public class func left(_ target: MSLayoutTarget) -> Self { Self(target, .left) }
    
    /// 右侧
    public class func right(_ target: MSLayoutTarget) -> Self { Self(target, .right) }
    
    /// 布局前方
    public class func leading(_ target: MSLayoutTarget) -> Self { Self(target, .leading) }
    
    /// 布局后方
    public class func trailing(_ target: MSLayoutTarget) -> Self { Self(target, .trailing) }
    
    /// 中心
    public class func centerX(_ target: MSLayoutTarget) -> Self { Self(target, .centerX) }
}


#if canImport(UIKit)
/// 水平相关锚点属性
extension MSLayoutAnchor.XAxis {
    
    /// 左侧
    public class func leftMargin(_ target: MSLayoutTarget) -> Self { Self(target, .leftMargin) }
    
    /// 右侧
    public class func rightMargin(_ target: MSLayoutTarget) -> Self { Self(target, .rightMargin) }
    
    /// 布局前方
    public class func leadingMargin(_ target: MSLayoutTarget) -> Self { Self(target, .leadingMargin) }
    
    /// 布局后方
    public class func trailingMargin(_ target: MSLayoutTarget) -> Self { Self(target, .trailingMargin) }
    
    /// 中心
    public class func centerXMargin(_ target: MSLayoutTarget) -> Self { Self(target, .centerXWithinMargins) }
}
#endif
