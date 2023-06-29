import SwiftUI
import Core_Resources
import Movies_Feature

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel =
    FeaturesInjection.container.resolve(HomeViewModel.self)!
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state.currentSection {
                case .movies:
                    NowPlayingView()
                case .series:
                    Text("Series")
                case .actors:
                    Text("Actors")
                }
            }
            .toolbar {
                ToolbarItem(
                    placement: .navigationBarLeading,
                    content: {
                        MenuIcon { withAnimation { viewModel.toggleMenu() } }
                    }
                )
            }
        }
        .overlay(alignment: .leading) {
            if viewModel.state.isMenuOpen {
                HomeMenuView(
                    currentSection: viewModel.state.currentSection,
                    onSectionSelected: viewModel.setSection(selectedSecion:),
                    onCloseMenu: { withAnimation { viewModel.toggleMenu() } }
                )
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
