import Foundation

public struct PaginationResponse<T> : Decodable {
    var totalPages: Int
    var results: [T]
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case results
    }
}
