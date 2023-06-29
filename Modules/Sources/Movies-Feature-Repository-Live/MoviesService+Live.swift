import Movies_Feature_Repository
import Core_Providers

public extension MoviesService {
    static func live(endpoint: MoviesEndpoints) -> Self {
        .init(
            getNowPlaying: { page in
                endpoint
                    .getNowPlayingList(page: page)
                    .map(Pagination.init)
                    .eraseToAnyPublisher()
            },
            getMovieDetails: { id in
                endpoint
                    .getMovieDetails(id: id)
                    .map { _ in MovieDetails.mock }
                    .eraseToAnyPublisher()
            },
            getMovieRecommendations: { id in
                endpoint
                    .getMovieRecommendations(id: id)
                    .map(Pagination.init)
                    .eraseToAnyPublisher()
            },
            searchMovies: { query in
                endpoint
                    .searchMovies(query: query)
                    .map(Pagination.init)
                    .eraseToAnyPublisher()
            }
        )
    }
}

extension Pagination<Movie> {
   init(_ response: PaginationResponse<MovieResponse>) {
       self.init(
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        results: response.results.map(Movie.init)
       )
    }
}

extension Movie {
    init(_ response: MovieResponse) {
        self.init(
            id: response.id,
            adult: response.adult,
            backdropPath: response.backdropPath,
            originalTitle: response.originalTitle,
            overview: response.overview,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
            title: response.title,
            voteAverage: response.voteAverage,
            voteCount: response.voteCount,
            watchLater: false,
            favorite: false
        )
    }
}
