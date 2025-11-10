//
//  MSLayoutConfig.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/30.
//

#if canImport(UIKit)
    import UIKit
    public typealias MSLayoutDirection = UIUserInterfaceLayoutDirection
#else
    import AppKit
    public typealias MSLayoutDirection = NSUserInterfaceLayoutDirection
#endif


/// 布局配置
public struct MSLayoutConfig {
    
    /// 布局方向
    public static var layoutDirection: MSLayoutDirection = .leftToRight
}
