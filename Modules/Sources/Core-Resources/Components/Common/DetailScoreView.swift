import SwiftUI

struct MoviesScoreView: View {
    let size: CGFloat
    let value: Double
    
    var body: some View {
        CircularProgressView(size: size, value: calcScore())
            .overlay(
                Text(size < 70 ? "" : String(value))
                    .font(size > 120 ? .largeTitle : .title)
            )
    }
    
    private func calcScore() -> Double { -Double((value / 10) - 1) }
}

struct MoviesScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScoreView(size: 100, value: 4.5)
    }
}
