//
//  MSLayoutTarget.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/28.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


public protocol MSLayoutTarget: AnyObject {}


extension MSLayoutView: MSLayoutTarget {}


extension MSLayoutGuide: MSLayoutTarget {}


extension MSLayoutTarget {
    
    /// 获取当前视图的父视图
    internal var owner: MSLayoutView? {
        if let view = self as? MSLayoutView {
            return view.superview
        }
        if let guide = self as? MSLayoutGuide {
            return guide.owningView
        }
        return nil
    }
}





