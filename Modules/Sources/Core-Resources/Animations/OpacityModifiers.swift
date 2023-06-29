import SwiftUI
import Foundation

public struct ShowOnMiddleOfViewAnimation: ViewModifier {
    public var currentY: CGFloat
    
    public init(currentY: CGFloat) {
        self.currentY = currentY
    }
    
    public func body(content: Content) -> some View {
        #if os(iOS)
        return content
            .opacity(calcOpacity(minY: currentY))
        #else
        return content
        #endif
    }
    
    private func calcOpacity(minY: CGFloat) -> CGFloat {
        #if os(iOS)
        let screenLine = UIScreen.main.bounds.height / 3
        
        if minY > screenLine {
            let opacity = screenLine / minY
            
            if opacity < 0.2 {
                return 0.2
            }
            
            return opacity
        }
        
        return 1
        #else
        return 1
        #endif
    }
}
