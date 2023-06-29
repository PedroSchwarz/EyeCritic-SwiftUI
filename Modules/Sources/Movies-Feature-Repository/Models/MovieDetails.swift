public struct MovieDetails {
    public let budget: Int
    public let genres: [Detail]
    public let homepage: String?
    public let productionCompanies: [Detail]
    public let revenue: Int
    public let runtime: Int?
    
    public init(
        budget: Int,
        genres: [Detail],
        homepage: String? = nil,
        productionCompanies: [Detail],
        revenue: Int,
        runtime: Int? = nil
    ) {
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.productionCompanies = productionCompanies
        self.revenue = revenue
        self.runtime = runtime
    }
    
    public struct Detail {
        public var id: Int
        public var name: String
        
        public init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
    }
}

#if DEBUG
public extension MovieDetails {
    static let mock: Self = .init(
        budget: 10_000,
        genres: [Detail(id: 1, name: "Genre 1")],
        productionCompanies: [Detail(id: 1, name: "Company 1")],
        revenue: 100_000_000
    )
}
#endif
