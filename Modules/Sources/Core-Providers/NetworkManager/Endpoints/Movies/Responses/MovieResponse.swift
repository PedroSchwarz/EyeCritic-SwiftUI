import Foundation

public struct MovieResponse : Decodable {
    var id: Int
    var adult: Bool
    var backdropPath: String?
    var originalTitle: String
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var title: String
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
