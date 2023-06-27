import Combine
import Core_Resources

public struct MoviesEndpoints {
    let server: NetworkManager
    
    public init(server: NetworkManager) {
        self.server = server
    }
    
    public func getNowPlayingList(page: Int) -> AnyPublisher<PaginationResponse<MovieResponse>, Failure> {
        return server
            .get(
                path: "/movie/now_playing",
                decodable: PaginationResponse<MovieResponse>.self
            )
            .handleEvents(receiveOutput: {
                print("Here \($0)")
            })
            .eraseToAnyPublisher()
    }
}
