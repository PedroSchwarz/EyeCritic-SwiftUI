import SwiftUI

public struct MenuIcon: View {
    let onActionClicked: () -> Void
    
    public init(onActionClicked: @escaping () -> Void) {
        self.onActionClicked = onActionClicked
    }
    
    public var body: some View {
        Button(
            action: onActionClicked,
            label: {
                VStack(alignment: .leading, spacing: .s_xs) {
                    Rectangle()
                        .frame(width: .d_xm, height: .d_xxs)
                    
                    Rectangle()
                        .frame(width: .d_xm, height: .d_xxs)
                    
                    Rectangle()
                        .frame(width: .d_xm, height: .d_xxs)
                }
                .foregroundColor(.primary)
            }
        )
    }
}

struct MenuIcon_Previews: PreviewProvider {
    static var previews: some View {
        MenuIcon(onActionClicked: { })
    }
}
