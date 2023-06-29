import SwiftUI

public struct OffsetDownOnScrollDownAnimation: ViewModifier {
    let currentY: CGFloat
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        return content
            .offset(y: calcOffsetImage(minY: currentY))
    }
    
    private func calcOffsetImage(minY: CGFloat) -> CGFloat {
        if minY <= -600 {
            return -600
        }
        
        if minY < 0 {
            return minY / (.isWatchOS ? -50 : -8)
        }
        
        return 0
    }
}

public struct OffsetUpOnScrollDownAnimation: ViewModifier {
    let currentY: CGFloat
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        return content
            .offset(y: calcOffset(minY: currentY))
    }
    
    private func calcOffset(minY: CGFloat) -> CGFloat {
        if minY <= -600 {
            return -600
        }
        
        if minY < 0 {
            return minY / (.isWatchOS ? 20 : 5)
        }
        
        return 0
    }
}

public struct OffsetUpWithStepsOnScrollDownAnimation: ViewModifier {
    let currentY: CGFloat
    let deviceSize: DeviceSizeType =
    FeaturesInjection.container.resolve(DeviceSizeType.self)!
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        return content
            .offset(y: calcOffset(minY: currentY))
    }
    
    private func calcOffset(minY: CGFloat) -> CGFloat {
        switch deviceSize {
        case .iPhone(let height):
            let screenFirstLine = height / 2.5
            
            if minY < screenFirstLine {
                let offset = ((minY - screenFirstLine) / 10) - 30
                if offset <= -50 {
                    return -50
                }
                return offset
            }
            
            let screenSecondLine = height / 1.7
            
            if minY < screenSecondLine {
                let offset = ((minY - screenSecondLine) / 5)
                if offset <= -30 {
                    return -30
                }
                return offset
            }
            
            return 0
        case .watch(let height):
            let screenSecondLine = height / 4
            
            if minY < screenSecondLine {
                let offset = ((minY - screenSecondLine) / 5)
                if offset <= -30 {
                    return -30
                }
                return offset
            }
            
            return 0
        }
    }
}
