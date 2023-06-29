import Foundation

public extension CGFloat {
    // Mark: Spacing sizes - s for spacing
    static let s_xxs: Self = 2
    static let s_xs: Self = 4
    static let s_s: Self = 8
    static let s_m: Self = 12
    static let s_xm: Self = 16
    static let s_l: Self = 24
    static let s_xl: Self = 32
    static let s_xxl: Self = 48
    // Mark: General width/height sizes - d for dimension
    static let d_xxs: Self = 2
    static let d_xs: Self = 5
    static let d_s: Self = 10
    static let d_m: Self = 15
    static let d_xm: Self = 20
    static let d_l: Self = 30
    static let d_xl: Self = 50
    static let d_xxl: Self = 100
}

public enum DeviceSizeType {
    case iPhone(CGFloat)
    case watch(CGFloat)
}
