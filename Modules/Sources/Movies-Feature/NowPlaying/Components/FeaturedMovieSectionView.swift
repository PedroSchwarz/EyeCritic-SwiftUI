import SwiftUI
import Movies_Feature_Repository
import Core_Resources

struct FeaturedMovieSection: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Movie Released")
                .font(.largeTitle)
                .bold()
            
            FeaturedMovieCardView(movie: movie)
        }
        .padding(.horizontal, 10)
        .padding(.top, 30)
    }
}

struct FeaturedMovieSection_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieSection(movie: .mock)
    }
}
