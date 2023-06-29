import Combine
import Core_Resources

public struct MoviesService {
    public let getNowPlaying: (_ page: Int) -> AnyPublisher<Pagination<Movie>, Failure>
    public let getMovieDetails: (_ id: Int) -> AnyPublisher<MovieDetails, Failure>
    public let getMovieRecommendations: (_ id: Int) -> AnyPublisher<Pagination<Movie>, Failure>
    public let searchMovies: (_ query: String) -> AnyPublisher<Pagination<Movie>, Failure>
    
    public init(
        getNowPlaying: @escaping (_: Int) -> AnyPublisher<Pagination<Movie>, Failure>,
        getMovieDetails: @escaping (_: Int) -> AnyPublisher<MovieDetails, Failure>,
        getMovieRecommendations: @escaping (_: Int) -> AnyPublisher<Pagination<Movie>, Failure>,
        searchMovies: @escaping (_: String) -> AnyPublisher<Pagination<Movie>, Failure>
    ) {
        self.getNowPlaying = getNowPlaying
        self.getMovieDetails = getMovieDetails
        self.getMovieRecommendations = getMovieRecommendations
        self.searchMovies = searchMovies
    }
}
