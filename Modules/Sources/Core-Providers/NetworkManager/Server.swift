import Foundation
import Alamofire
import Combine
import Core_Resources

public protocol NetworkManager {
    func get<T>(
        path: String,
        decodable: T.Type,
        parameters: Parameters?
    ) -> AnyPublisher<T, Failure>  where T : Decodable
}

public struct Server: NetworkManager {
    public init() { }
    
    public func get<T>(
        path: String,
        decodable: T.Type,
        parameters: Parameters? = nil
    ) -> AnyPublisher<T, Failure> where T : Decodable {
       AF.request(
            "https://api.themoviedb.org/3\(path)",
            parameters: parameters,
            interceptor: Interceptor(adapters: [AuthAdapter()])
        )
            .publishDecodable(type: T.self, queue: .main, decoder: JSONDecoder())
            .tryMap { response in
                switch response.result {
                case .success(let value):
                    return value
                case .failure(let error):
                    throw AFError.createURLRequestFailed(error: error)
                }
            }
            .mapError({
                error in
                return Failure.serverFailure(error: error.localizedDescription)
            })
            .eraseToAnyPublisher()
    }
}
