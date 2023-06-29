import SwiftUI

public struct BlurOnScrollDownAnimation: ViewModifier {
    public let currentY: CGFloat
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        return content
            .blur(radius: calcBlur(minY: currentY))
    }
    
    private func calcBlur(minY: CGFloat) -> CGFloat {
        if (-minY < 0) {
            return 0
        }
        
        if (-minY / (.isWatchOS ? 250 : 70) > 15) {
            return 15
        }
        
        return -minY / (.isWatchOS ? 250 : 70)
    }
}
