import Foundation

public struct Movie : Identifiable {
    public var id: Int
    public var adult: Bool
    public var backdropUrl: String?
    public var originalTitle: String
    public var overview: String
    public var posterUrl: String?
    public var releaseDate: String
    public var title: String
    public var voteAverage: Double
    public var voteCount: Int
    public var watchLater: Bool
    public var favorite: Bool
    
    public init(
        id: Int,
        adult: Bool,
        backdropUrl: String? = nil,
        originalTitle: String,
        overview: String,
        posterUrl: String? = nil,
        releaseDate: String,
        title: String,
        voteAverage: Double,
        voteCount: Int,
        watchLater: Bool,
        favorite: Bool
    ) {
        self.id = id
        self.adult = adult
        self.backdropUrl = backdropUrl
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterUrl = posterUrl
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
