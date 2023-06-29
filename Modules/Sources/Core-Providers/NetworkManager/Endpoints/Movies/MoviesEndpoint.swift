import Combine
import Core_Resources

public struct MoviesEndpoints {
    let server: NetworkManager
    
    public init(server: NetworkManager) {
        self.server = server
    }
    
    public func getNowPlayingList(page: Int) -> AnyPublisher<PaginationResponse<MovieResponse>, Failure> {
        server
            .get(
                path: "/movie/now_playing",
                decodable: PaginationResponse<MovieResponse>.self,
                parameters: ["page": page]
            )
            .eraseToAnyPublisher()
    }
    
    public func getMovieDetails(id: Int) -> AnyPublisher<MovieDetailsResponse, Failure> {
        server
            .get(
                path: "/movie/\(id)",
                decodable: MovieDetailsResponse.self,
                parameters: nil
            )
            .eraseToAnyPublisher()
    }
    
    public func getMovieRecommendations(id: Int) -> AnyPublisher<PaginationResponse<MovieResponse>, Failure> {
        server
            .get(
                path: "/movie/\(id)/recommendations",
                decodable: PaginationResponse<MovieResponse>.self,
                parameters: nil
            )
            .eraseToAnyPublisher()
    }
    
    public func searchMovies(query: String) -> AnyPublisher<PaginationResponse<MovieResponse>, Failure> {
        server
            .get(
                path: "/search/movie",
                decodable: PaginationResponse<MovieResponse>.self,
                parameters: ["query": query]
            )
            .eraseToAnyPublisher()
    }
}
