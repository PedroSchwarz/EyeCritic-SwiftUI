import SwiftUI

public struct DetailScoreView: View {
    let size: CGFloat
    let value: Double
    let colors: [Color]
    
    public init(size: CGFloat, value: Double, colors: [Color]) {
        self.size = size
        self.value = value
        self.colors = colors
    }
    
    public var body: some View {
        CircularProgressView(size: size, value: calcScore(), colors: colors)
            .overlay(
                Text(size < 70 ? "" : String(value))
                    .font(size > 120 ? .largeTitle : .title)
            )
    }
    
    private func calcScore() -> Double { -Double((value / 10) - 1) }
}

struct DetailScoreView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScoreView(size: 100, value: 4.5, colors: [.accentColor, .red])
    }
}
