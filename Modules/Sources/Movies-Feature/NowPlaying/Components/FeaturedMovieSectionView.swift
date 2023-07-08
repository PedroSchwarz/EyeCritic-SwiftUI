import SwiftUI
import Movies_Feature_Repository
import Core_Resources

struct FeaturedMovieSectionView: View {
    let movie: Movie
    let onPressed: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Movie Released")
                .bold()
                .if(
                    .isWatchOS,
                    transform: {
                        $0.font(.body)
                    },
                    else: {
                        $0.font(.largeTitle)
                    }
                )
             
                FeaturedMovieCardView(movie: movie)
                    .onTapGesture { onPressed() }
                    
        }
        .padding(.horizontal, .s_s)
        .padding(.top, .s_xl)
    }
}

struct FeaturedMovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieSectionView(movie: .mock, onPressed: { })
    }
}
