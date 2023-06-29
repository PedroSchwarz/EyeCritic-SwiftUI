import Foundation

public struct Movie : Identifiable {
    public let id: Int
    public let adult: Bool
    public let backdropPath: String?
    public let originalTitle: String
    public let overview: String
    public let posterPath: String?
    public let releaseDate: String
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    public let watchLater: Bool
    public let favorite: Bool
    
    public var backdropURL: String {
        "https://image.tmdb.org/t/p/w300/\(backdropPath ?? "")"
    }
    
    public var posterURL: String {
        "https://image.tmdb.org/t/p/w154/\(posterPath ?? "")"
    }
    
    public init(
        id: Int,
        adult: Bool,
        backdropPath: String? = nil,
        originalTitle: String,
        overview: String,
        posterPath: String? = nil,
        releaseDate: String,
        title: String,
        voteAverage: Double,
        voteCount: Int,
        watchLater: Bool,
        favorite: Bool
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.watchLater = watchLater
        self.favorite = favorite
    }
}

#if DEBUG
public extension Movie {
    static let mock: Self = .init(
        id: 1,
        adult: false,
        originalTitle: "Movie 1",
        overview: "Movie 1 Overview",
        releaseDate: "20 Out",
        title: "Movie 1 Title",
        voteAverage: 20,
        voteCount: 1000,
        watchLater: false,
        favorite: false
    )
}
#endif
