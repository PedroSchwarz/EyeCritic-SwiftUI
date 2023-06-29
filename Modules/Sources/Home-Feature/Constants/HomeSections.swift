public enum HomeSection: CaseIterable {
    case movies
    case series
    case actors
}

public extension HomeSection {
    var title: String {
        switch self {
        case .movies:
            return "Movies"
        case .series:
            return "Series"
        case .actors:
            return "Actors"
        }
    }
}
