import Foundation

public struct PaginationResponse<T> : Decodable where T : Decodable {
    public let totalPages: Int
    public let currentPage: Int
    public let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "page"
        case results
    }
}
