import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(
        _ conditional: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if (conditional) {
            transform(self)
        } else {
           self
        }
    }
    
    @ViewBuilder func `if`<IfContent: View, ElseContent: View>(
        _ conditional: Bool,
        transform: (Self) -> IfContent,
        `else`: (Self) -> ElseContent
    ) -> some View {
        if (conditional) {
            transform(self)
        } else {
            `else`(self)
        }
    }
}

public extension Bool {
    static var isWatchOS: Bool {
        #if os(iOS)
        return false
        #else
        return true
        #endif
    }
}
