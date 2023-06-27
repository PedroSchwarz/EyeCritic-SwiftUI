import SwiftUI
import Movies_Feature_Repository

struct FeaturedMovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Movie Released")
                .font(.largeTitle)
                .bold()
            
            GeometryReader { geo in
                ZStack {
                    //                                    MovieImage(image: movie.posterUrl, size: 300)
                    //                                        .overlay(LinearGradient(
                    //                                            colors: [Color.clear, Color.black.opacity(0.5), Color.black.opacity(0.6)],
                    //                                            startPoint: .top,
                    //                                            endPoint: .bottom
                    //                                        )
                    //                                            .cornerRadius(10)
                    //                                        )
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        HStack {
                            Text(movie.title)
                                .font(.title2)
                                .bold()
                                .lineLimit(2)
                            
                            Spacer()
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
            }
            .padding(.horizontal, 10)
            .padding(.top, 30)
        }
    }
}

struct FeaturedMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieCard(movie: .mock)
    }
}
