//
//  MSLayoutGuide.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/28.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


#if canImport(UIKit)
    @available(iOS 9.0, *)
    public typealias MSLayoutGuide = UILayoutGuide
#else
    @available(OSX 10.11, *)
    public typealias MSLayoutGuide = NSLayoutGuide
#endif
