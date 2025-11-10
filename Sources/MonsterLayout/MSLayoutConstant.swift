//
//  MSLayoutConstant.swift
//  MonsterLayout
//
//  Created by KnightSama on 2025/5/30.
//

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


/// 布局常量
public protocol MSLayoutConstant {}


/// 扩展 `CGPoint`
extension CGPoint: MSLayoutConstant {}


/// 扩展 `CGSize`
extension CGSize: MSLayoutConstant {}


/// 扩展常量方法
extension MSLayoutConstant {
    
    /// 获取当前常量的值
    internal func constantValue(for attribute: MSLayoutAttribute) -> CGFloat {
        
        if let value = self as? CGFloat { return .from(value, for: attribute) }
        
        if let value = self as? Float   { return .from(CGFloat(value), for: attribute) }
        
        if let value = self as? Double  { return .from(CGFloat(value), for: attribute) }
        
        if let value = self as? Int     { return .from(CGFloat(value), for: attribute) }
        
        if let value = self as? UInt    { return .from(CGFloat(value), for: attribute) }
        
        if let value = self as? CGSize  { return .from(value, for: attribute) }
        
        if let value = self as? CGPoint { return .from(value, for: attribute) }
        
        if let value = self as? MSLayoutInsets { return .from(value, for: attribute) }
        
        #if canImport(UIKit)
        if let value = self as? NSDirectionalEdgeInsets { return .from(value, for: attribute) }
        #endif

        return 0.0
    }
}


/// 扩展浮点型方法进行转换
fileprivate extension CGFloat {
    
    /// 从 `MSLayoutInsets` 转换数据
    static func from(_ value: MSLayoutInsets, for attribute: MSLayoutAttribute) -> CGFloat {
        switch attribute {
        case .left:                      return value.left
        case .top:                       return value.top
        case .right:                     return -value.right
        case .bottom, .lastBaseline:     return -value.bottom
        case .leading:                   return (MSLayoutConfig.layoutDirection == .leftToRight) ? value.left : value.right
        case .trailing:                  return (MSLayoutConfig.layoutDirection == .leftToRight) ? -value.right : -value.left
        case .centerX:                   return (value.left - value.right) / 2
        case .centerY:                   return (value.top - value.bottom) / 2
        case .width:                     return -(value.left + value.right)
        case .height:                    return -(value.top + value.bottom)
        #if canImport(UIKit)
        case .leftMargin:                return value.left
        case .topMargin, .firstBaseline: return value.top
        case .rightMargin:               return -value.right
        case .bottomMargin:              return -value.bottom
        case .leadingMargin:             return (MSLayoutConfig.layoutDirection == .leftToRight) ? value.left : value.right
        case .trailingMargin:            return (MSLayoutConfig.layoutDirection == .leftToRight) ? -value.right : -value.left
        case .centerXWithinMargins:      return (value.left - value.right) / 2
        case .centerYWithinMargins:      return (value.top - value.bottom) / 2
        #endif
        default:                         return 0.0
        }
    }
    
    /// 从 `CGPoint` 转换数据
    static func from(_ value: CGPoint, for attribute: MSLayoutAttribute) -> CGFloat {
        switch attribute {
        case .left, .right, .leading, .trailing, .centerX:
            return value.x
        case .top, .bottom, .centerY, .lastBaseline:
            return value.y
        #if canImport(UIKit)
        case .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins:
            return value.x
        case .topMargin, .bottomMargin, .centerYWithinMargins, .firstBaseline:
            return value.y
        #endif
        default:
            return 0.0
        }
    }
    
    /// 从 `CGSize` 转换数据
    static func from(_ value: CGSize, for attribute: MSLayoutAttribute) -> CGFloat {
        switch attribute {
        case .width:  return value.width
        case .height: return value.height
        default:      return 0
        }
    }
    
    /// 从 `CGFloat` 转换数据
    static func from(_ value: CGFloat, for attribute: MSLayoutAttribute) -> CGFloat {
        switch attribute {
        case .left, .leading, .centerX, .top, .centerY, .width, .height:
            return value
        case .right, .trailing, .bottom, .lastBaseline:
            return -value
        #if canImport(UIKit)
        case .leftMargin, .leadingMargin, .centerXWithinMargins, .topMargin, .centerYWithinMargins, .firstBaseline:
            return value
        case .rightMargin, .trailingMargin, .bottomMargin:
            return -value
        #endif
        default:
            return value
        }
    }
    
    #if canImport(UIKit)
    /// 从 `NSDirectionalEdgeInsets` 转换数据
    static func from(_ value: NSDirectionalEdgeInsets, for attribute: MSLayoutAttribute) -> CGFloat {
        switch attribute {
        case .left, .leftMargin:                    return (MSLayoutConfig.layoutDirection == .leftToRight) ? value.leading : value.trailing
        case .top, .topMargin, .firstBaseline:      return value.top
        case .right, .rightMargin:                  return (MSLayoutConfig.layoutDirection == .leftToRight) ? -value.trailing : -value.leading
        case .bottom, .bottomMargin, .lastBaseline: return -value.bottom
        case .leading, .leadingMargin:              return value.leading
        case .trailing, .trailingMargin:            return -value.trailing
        case .centerX, .centerXWithinMargins:       return (value.leading - value.trailing) / 2
        case .centerY, .centerYWithinMargins:       return (value.top - value.bottom) / 2
        case .width:                                return -(value.leading + value.trailing)
        case .height:                               return -(value.top + value.bottom)
        default:                                    return 0.0
        }
    }
    #endif
}
