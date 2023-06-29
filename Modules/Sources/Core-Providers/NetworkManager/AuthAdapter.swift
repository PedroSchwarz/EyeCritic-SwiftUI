import Foundation
import Alamofire
import Core_Resources

struct AuthAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        do {
            let apiKey = try Environment.getValue(for: .apiKey)
            var urlRequest = urlRequest
            urlRequest.headers.add(.authorization(bearerToken: apiKey))
            completion(.success(urlRequest))
        } catch {
            completion(.failure(Failure.serverFailure(error: error.localizedDescription)))
        }
    }
}
