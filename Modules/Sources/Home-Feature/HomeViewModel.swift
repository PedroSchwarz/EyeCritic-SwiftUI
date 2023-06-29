import Foundation
import SwiftUI
import Combine

public class HomeViewModel: ObservableObject {
    @Published private(set) var state: State = .init()
    
    public init() {}
    
    public func setSection(selectedSecion: HomeSection) {
        state.currentSection = selectedSecion
    }
    
    public func toggleMenu() {
        state.isMenuOpen.toggle()
    }
}
