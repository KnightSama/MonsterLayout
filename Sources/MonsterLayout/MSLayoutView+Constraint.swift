//
//  MSLayoutView+Constraint.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/6/3.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


// MARK: - 新增布局约束
extension MSLayoutView {
    
    /// 添加视图与约束
    public func addSubview(_ view: MSLayoutView, _ constraints: MSLayoutDescription...) {
        addSubview(view)
        view.append(constraints)
    }
    
    /// 添加 `LayoutGuide` 与约束
    public func addGuide(_ layoutGuide: MSLayoutGuide, _ constraints: MSLayoutDescription) {
        addLayoutGuide(layoutGuide)
        layoutGuide.append(constraints)
    }
}


// MARK: - 插入子视图并布局
extension MSLayoutView {
    
    /// 插入视图同时布局
    @discardableResult public func insert(_ view: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        addSubview(view)
        // 添加约束
        view.append(constraints)
        // 返回
        return self
    }
    
    /// 插入视图同时布局
    @discardableResult public func insert(_ view: MSLayoutView, at index: Int, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        insertSubview(view, at: index)
        // 添加约束
        view.append(constraints)
        // 返回
        return self
    }
    
    /// 插入视图同时布局
    @discardableResult public func insert(_ view: MSLayoutView, above subview: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        insertSubview(view, aboveSubview: subview)
        // 添加约束
        view.append(constraints)
        // 返回
        return self
    }
    
    /// 插入视图同时布局
    @discardableResult public func insert(_ view: MSLayoutView, below subview: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        insertSubview(view, belowSubview: subview)
        // 添加约束
        view.append(constraints)
        // 返回
        return self
    }
}


// MARK: - 添加到指定父视图并布局
extension MSLayoutView {
    
    /// 插入到指定父视图并布局
    @discardableResult public func insertTo(_ view: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        view.addSubview(self)
        // 添加约束
        self.append(constraints)
        // 返回
        return self
    }
    
    /// 插入到指定父视图并布局
    @discardableResult public func insertTo(_ view: MSLayoutView, at index: Int, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        view.insertSubview(self, at: index)
        // 添加约束
        self.append(constraints)
        // 返回
        return self
    }
    
    /// 插入到指定父视图并布局
    @discardableResult public func insertTo(_ view: MSLayoutView, above subview: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        view.insertSubview(self, aboveSubview: subview)
        // 添加约束
        self.append(constraints)
        // 返回
        return self
    }
    
    /// 插入到指定父视图并布局
    @discardableResult public func insertTo(_ view: MSLayoutView, below subview: MSLayoutView, _ constraints: MSLayoutDescription...) -> Self {
        // 添加视图
        view.insertSubview(self, belowSubview: subview)
        // 添加约束
        self.append(constraints)
        // 返回
        return self
    }
}
