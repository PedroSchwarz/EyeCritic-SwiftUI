public struct MovieDetailsResponse: Decodable {
    public let budget: Int
    public let genres: [DetailResponse]
    public let homepage: String?
    public let productionCompanies: [DetailResponse]
    public let revenue: Int
    public let runtime: Int?
    
    public init(
        budget: Int,
        genres: [DetailResponse],
        homepage: String? = nil,
        productionCompanies: [DetailResponse],
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
    
    public struct DetailResponse: Decodable {
        public var id: Int
        public var name: String
        
        public init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case budget
        case genres
        case homepage
        case productionCompanies = "production_companies"
        case revenue
        case runtime
    }
}
