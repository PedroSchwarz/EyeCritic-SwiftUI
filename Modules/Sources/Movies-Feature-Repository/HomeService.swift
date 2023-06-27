import Combine
import Core_Resources

public struct HomeService {
    public let getMovies: (_ page: Int) -> AnyPublisher<[Movie], Failure>
    
    public init(getMovies: @escaping (_: Int) -> AnyPublisher<[Movie], Failure>) {
        self.getMovies = getMovies
    }
}
