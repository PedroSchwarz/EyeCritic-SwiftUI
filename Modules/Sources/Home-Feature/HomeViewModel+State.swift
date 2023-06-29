import Foundation

public extension HomeViewModel {
    struct State {
        var currentSection: HomeSection
        var isMenuOpen: Bool
        
        public init(
            currentSection: HomeSection = .movies,
            isMenuOpen: Bool = false
        ) {
            self.currentSection = currentSection
            self.isMenuOpen = isMenuOpen
        }
    }
}
