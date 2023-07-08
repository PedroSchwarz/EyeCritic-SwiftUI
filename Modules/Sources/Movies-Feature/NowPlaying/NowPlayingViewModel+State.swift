import Movies_Feature_Repository
import SwiftUI

public extension NowPlayingViewModel {
    struct State {
        var currentPage: Int
        var movies: [Movie]
        var isLoading: Bool
        var errorMessage: String?
        
        public init(
            currentPage: Int = 0,
            movies: [Movie] = [],
            isLoading: Bool = true,
            errorMessage: String? = nil
        ) {
            self.currentPage = currentPage
            self.movies = movies
            self.isLoading = isLoading
            self.errorMessage = errorMessage
        }
    }
}
