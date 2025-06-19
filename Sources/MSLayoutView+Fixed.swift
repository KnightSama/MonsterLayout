//
//  MSLayoutView+Fixed.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/26.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 固定视图约束
extension MSLayoutView {
    
    /// 视图的抗拉伸与抗压缩优先级为最高
    public var fixed: Self { fixed() }
    
    /// 视图的抗拉伸与抗压缩优先级
    @discardableResult
    public func fixed(_ priority: MSLayoutPriority = .required) -> Self {
        fixed(.horizontal, priority)
        fixed(.vertical,   priority)
        return self
    }
    
    /// 视图在指定方向上的抗拉伸与抗压缩优先级
    @discardableResult
    public func fixed(_ axis: MSLayoutAxis, _ priority: MSLayoutPriority = .required) -> Self {
        refuseCompress(axis, priority)
        refuseStretch(axis,  priority)
        return self
    }
}


/// 不可压缩优先级设置
extension MSLayoutView {
    
    /// 视图不可压缩优先级
    @discardableResult
    public func refuseCompress(_ priority: MSLayoutPriority = .required) -> Self {
        setContentCompressionResistancePriority(priority.origin, for: .horizontal)
        setContentCompressionResistancePriority(priority.origin, for: .vertical)
        return self
    }
    
    /// 视图不可压缩优先级
    @discardableResult
    public func refuseCompress(_ axis: MSLayoutAxis, _ priority: MSLayoutPriority = .required) -> Self {
        setContentCompressionResistancePriority(priority.origin, for: axis)
        return self
    }
}


/// 不可拉伸优先级设置
extension MSLayoutView {
    
    /// 视图不可拉伸优先级
    @discardableResult
    public func refuseStretch(_ priority: MSLayoutPriority = .required) -> Self {
        setContentHuggingPriority(priority.origin, for: .horizontal)
        setContentHuggingPriority(priority.origin, for: .vertical)
        return self
    }
    
    /// 视图不可拉伸优先级
    @discardableResult
    public func refuseStretch(_ axis: MSLayoutAxis, _ priority: MSLayoutPriority = .required) -> Self {
        setContentHuggingPriority(priority.origin, for: axis)
        return self
    }
}
