import SwiftUI
import Movies_Feature_Repository
import Core_Resources

struct MovieCardView: View {
    let movie: Movie
    let height: CGFloat
    
    @State private var originalY: CGFloat = .zero
    
    init(movie: Movie, height: CGFloat = 250) {
        self.movie = movie
        self.height = height
    }
    
    var body: some View {
        GeometryReader { proxy in
            let currentY = proxy.frame(in: .global).minY
            let calcY = currentY - originalY
            
            ImageView(image: movie.posterURL, height: height)
                .blur(radius: 0.8)
                .modifier(ShowOnMiddleOfViewAnimation(currentY: currentY))
                .overlay(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: .s_xm) {
                        Spacer()
                        
                        Text(movie.title)
                            .font(.title3).bold()
                            .multilineTextAlignment(.leading)
                        
                        HStack(alignment: .top, spacing: .s_s) {
                            DetailScoreView(
                                size: .d_l,
                                value: movie.voteAverage,
                                colors: [.accentColor, .red]
                            )
                            
                            Spacer()
                            
                            PlatformWrapper(
                                iOS: {
                                    VStack {
                                        Text(movie.releaseDate)
                                        Text("\(movie.voteCount) Votes")
                                    }
                                    .font(.body)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                                },
                                watchOS: { EmptyView.init() }
                            )
                        }
                    }
                    .if(
                        .isWatchOS,
                        transform: {
                            $0.modifier(OffsetUpOnScrollDownAnimation(currentY: calcY))
                        }
                    )
                    .frame(height: height)
                    .padding(.horizontal, .s_m)
                    .padding(.bottom, .s_l)
                    .background(
                        LinearGradient(
                            colors: [
                                Color("SecondaryColor").opacity(0.1),
                                Color("SecondaryColor").opacity(0.3),
                                Color("SecondaryColor").opacity(0.9),
                                Color("SecondaryColor").opacity(0.9)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
                .clipShape(RoundedRectangle(cornerRadius: .s_m))
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .if(
                    .isWatchOS,
                    transform: {
                        $0
                        .modifier(OffsetDownOnScrollDownAnimation(currentY: calcY))
                        .modifier(BlurOnScrollDownAnimation(currentY: calcY))
                        .modifier(OffsetUpWithStepsOnScrollDownAnimation(currentY: currentY))
                    },
                    else: {
                        $0
                        .modifier(ShowOnMiddleOfViewAnimation(currentY: currentY))
                        .modifier(OffsetUpWithStepsOnScrollDownAnimation(currentY: currentY))
                    }
                )
                .onAppear {
                    if (originalY == .zero) {
                        originalY = proxy.frame(in: .global).minY
                    }
                }
        }
        .frame(height: height)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: .mock)
    }
}
