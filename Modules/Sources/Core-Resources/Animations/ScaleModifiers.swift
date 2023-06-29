import SwiftUI

public struct ScaleUpOnScrollDownAnimation: ViewModifier {
    public var currentY: CGFloat
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        return content
            .scaleEffect(
                x: calcScale(minY: currentY),
                y: calcScale(minY: currentY),
                anchor: .center
            )
    }
    
    private func calcScale(minY: CGFloat) -> CGFloat {
        let scale = (-minY / 3000) + 1
        
        if scale > 1.05 {
            return 1.05
        }
        
        if scale <= 1 {
            return 1
        }
        
        return scale
    }
}
