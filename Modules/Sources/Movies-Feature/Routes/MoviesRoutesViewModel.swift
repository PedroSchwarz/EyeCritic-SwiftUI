import SwiftUI

public class MoviesRoutesViewModel: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    public init() { }
    
    public func navigate(to route: any Hashable) {
        path.append(route)
    }
    
    public func replace(with route: any Hashable) {
        path.removeLast()
        path.append(route)
    }
    
    public func removeAll() {
        path.removeLast(path.count)
    }
}
