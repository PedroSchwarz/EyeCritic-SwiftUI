//
//  RemoteDataSource.swift
//  EyeCritic
//
//  Created by Pedro Rodrigues on 06/08/21.
//

import Foundation
import Combine
import Alamofire

protocol ReviewsRemoteDataSource {
    func getLastReview() -> AnyPublisher<ApiResult, Failure>
    func searchReviews(title: String) -> AnyPublisher<ApiResult, Failure>
}

struct ReviewsRemoteDataSourceImpl: ReviewsRemoteDataSource {
    var service: ReviewsService
    
    func getLastReview() -> AnyPublisher<ApiResult, Failure> {
        return service.getLastReview().eraseToAnyPublisher()
    }
    
    func searchReviews(title: String) -> AnyPublisher<ApiResult, Failure> {
        return service.searchReviews(title: title).eraseToAnyPublisher()
    }
}

struct ReviewsService {
    func getLastReview() -> AnyPublisher<ApiResult, Failure> {
        AF.request("\(API.Endpoints.AllReviews.PATH)")
            .publishDecodable(type: ApiResult.self, queue: .main, decoder: JSONDecoder())
            .tryMap({ response in
                switch response.result {
                case .success(let value):
                    return value
                case .failure:
                    throw Failure(type: .server)
                }
            })
            .mapError({ error in
                return Failure(type: .server)
            })
            .eraseToAnyPublisher()
    }
    
    func searchReviews(title: String) -> AnyPublisher<ApiResult, Failure> {
        AF.request("\(API.Endpoints.SearchReviews.PATH)&query=\(title)")
            .publishDecodable(type: ApiResult.self, queue: .main, decoder: JSONDecoder())
            .tryMap({ response in
                switch response.result {
                case .success(let value):
                    return value
                case .failure:
                    throw Failure(type: .server)
                }
            })
            .mapError({ error in
                return Failure(type: .server)
            })
            .eraseToAnyPublisher()
    }
}
