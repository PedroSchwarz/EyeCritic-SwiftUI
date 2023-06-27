import SwiftUI

struct CircularProgressView: View {
    let size: CGFloat
    let value: Double
    let colors: [Color]
    
    var body: some View {
        Circle()
            .stroke(
                Color.accentColor.opacity(0.2),
                style: .init(
                    lineWidth: size <= 30 ? 5 : 10,
                    lineCap: .round,
                    lineJoin: .round
                )
            )
            .frame(width: size, height: size)
            .overlay(
                Circle()
                    .trim(from: value, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: colors),
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        ),
                        style: .init(
                            lineWidth: size <= 30 ? 5 : 10,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .frame(width: size, height: size)
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 1, y: 0, z: 0)
                    )
            )
            .shadow(color: .accentColor.opacity(0.3), radius: 5, y: 2)
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(size: 100, value: 4.5, colors: [.accentColor, .red])
    }
}
