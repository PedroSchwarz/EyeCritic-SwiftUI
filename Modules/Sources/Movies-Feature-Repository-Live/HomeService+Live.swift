import Home_Feature_Repository
import Core_Providers

public extension HomeService {
    static func live(endpoint: MoviesEndpoints) -> Self {
        .init(
            getMovies: { page in
                endpoint
                    .getNowPlayingList(page: 1)
                    .handleEvents(receiveOutput: {
                        print("here", $0)
                    })
                    .map { _ in
                        [
                            Movie.mock
                        ]
                    }
                    .eraseToAnyPublisher()
            }
        )
    }
}
