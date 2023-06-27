import SwiftUI

public struct ScaleStuff: ViewModifier {
    let currentY: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .offset(y: calcOffsetImage(minY: currentY))
    }
    
    private func calcOffsetImage(minY: CGFloat) -> CGFloat {
        if minY <= -600 {
            return -600
        }
        
        if minY < 0 {
            return minY / -8
        }
        
        return 0
    }
}
