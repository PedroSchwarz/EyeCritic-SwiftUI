import SwiftUI
import Movies_Feature_Repository
import Core_Resources

struct FeaturedMovieCardView: View {
    let movie: Movie
    
    @State private var originalY: CGFloat = .zero
    
    var body: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .global).minY
            let currentY = minY - originalY
            
            ZStack {
                ImageView(
                    image: movie.backdropURL,
                    height: 300
                )
                .overlay(
                    LinearGradient(
                        colors: [
                            Color.clear,
                            Color("SecondaryColor").opacity(0.5),
                            Color("SecondaryColor").opacity(0.6)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .cornerRadius(.s_m)
                )
                .modifier(OffsetDownOnScrollDownAnimation(currentY: currentY))

                VStack(alignment: .leading, spacing: .s_m) {
                    Spacer()
                    HStack {
                        Text(movie.title)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        DetailScoreView(
                            size: .d_xl,
                            value: movie.voteAverage,
                            colors: [.accentColor, .red]
                        )
                    }
                    
                    Text(movie.overview)
                        .font(.title3)
                        .lineLimit(3)
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
            }
            .shadow(color: Color.black, radius: 20, x: 0, y: 2)
            .modifier(OffsetUpOnScrollDownAnimation(currentY: currentY))
            .modifier(BlurOnScrollDownAnimation(currentY: currentY))
            .modifier(ScaleUpOnScrollDownAnimation(currentY: currentY))
            .onAppear {
                if (originalY == .zero) {
                    originalY = proxy.frame(in: .global).minY
                }
            }
        }
        .frame(height: 300)
    }
}

struct FeaturedMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieCardView(movie: .mock)
    }
}
