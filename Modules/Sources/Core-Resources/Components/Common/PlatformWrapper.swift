import SwiftUI

public struct PlatformWrapper<P: View, W: View>: View {
    @ViewBuilder let iOS: P
    @ViewBuilder let watchOS: W
    
    public init(
        @ViewBuilder iOS: () -> P,
        @ViewBuilder watchOS: () -> W
    ) {
        self.iOS = iOS()
        self.watchOS = watchOS()
    }
    
    public var body: some View {
        #if os(iOS)
        iOS
        #else
        watchOS
        #endif
    }
}

struct PlatformWrapper_Previews: PreviewProvider {
    static var previews: some View {
        PlatformWrapper(iOS: {
            Text("iOS")
        }, watchOS: {
            Button(action: { }, label: { Text("press") })
        })
    }
}
