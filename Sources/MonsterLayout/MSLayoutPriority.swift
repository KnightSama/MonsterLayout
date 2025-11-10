//
//  MSLayoutPriority.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/26.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 视图布局优先级
public struct MSLayoutPriority {
    
    public let value: Float
}


extension MSLayoutPriority: ExpressibleByFloatLiteral {
    
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: Float) { self.value = value }
    
    public init(_ value: Float) { self.init(floatLiteral: value) }
}


extension MSLayoutPriority: ExpressibleByIntegerLiteral {
    
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int) { self.value = Float(value) }
    
    public init(_ value: Int) { self.init(integerLiteral: value) }
}


extension MSLayoutPriority: Equatable {
    
    public static func ==(lhs: MSLayoutPriority, rhs: MSLayoutPriority) -> Bool { lhs.value == rhs.value }
}


extension MSLayoutPriority {
    
    public static var required: MSLayoutPriority { 1000 }
    
    public static var high: MSLayoutPriority { 750 }
    
    public static var medium: MSLayoutPriority {
        #if os(OSX)
                return 501.0
        #else
                return 500.0
        #endif
    }
    
    public static var low: MSLayoutPriority { 250 }
}


extension MSLayoutPriority {
    
    public static func custom(_ value: Float) -> MSLayoutPriority { MSLayoutPriority(value) }
    
    public static func custom(_ value: Int) -> MSLayoutPriority { MSLayoutPriority(value) }
    
    public static func custom(_ value: CGFloat) -> MSLayoutPriority { MSLayoutPriority(Float(value)) }
    
    public static func custom(_ value: Double) -> MSLayoutPriority { MSLayoutPriority(Float(value)) }
    
    public static func custom(_ value: UInt) -> MSLayoutPriority { MSLayoutPriority(Float(value)) }
}


extension MSLayoutPriority {
    
    #if canImport(UIKit)
        public var origin: UILayoutPriority { UILayoutPriority(value) }
    #else
        public var origin: NSLayoutConstraint.Priority { NSLayoutConstraint.Priority(value) }
    #endif
}
