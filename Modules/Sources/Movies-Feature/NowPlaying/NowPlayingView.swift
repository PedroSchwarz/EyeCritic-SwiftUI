import SwiftUI
import Core_Resources
import Swinject

public struct NowPlayingView: View {
    @StateObject private var viewModel: NowPlayingViewModel =
    FeaturesInjection.container.resolve(NowPlayingViewModel.self)!
    @ObservedObject private var routesViewModel: MoviesRoutesViewModel = MoviesRoutesViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $routesViewModel.path) {
            VStack {
                if viewModel.state.isLoading && viewModel.state.movies.isEmpty {
                    VStack {
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                    }
                    .transition(.opacity)
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: .s_m) {
                            if .isWatchOS == false {
                                let firstMovie = viewModel.state.movies.first!
                                FeaturedMovieSectionView(movie: firstMovie) {
                                    routesViewModel.navigate(to: MoviesRoutes.details(id: firstMovie.id))
                                }
                            }
                            
                            PlatformWrapper(
                                iOS: {
                                    ItemsGridView(
                                        items: Array(viewModel.state.movies.dropFirst()),
                                        content: { movie in
                                            MovieCardView(movie: movie) {
                                                routesViewModel.navigate(to: MoviesRoutes.details(id: movie.id))
                                            }
                                        }
                                    )
                                },
                                watchOS: {
                                    ForEach(viewModel.state.movies) { movie in
                                        MovieCardView(movie: movie, height: 150) {
                                            routesViewModel.navigate(to: MoviesRoutes.details(id: movie.id))
                                        }
                                    }
                                }
                            )
                            
                            LoadMoreView(
                                isLoading: viewModel.state.isLoading,
                                onLoadMore: viewModel.loadData
                            )
                        }
                    }
                    .navigationTitle("Now Playing")
                    .transition(.opacity)
                    .navigationDestination(for: MoviesRoutes.self) { route in
                        switch route {
                        case let .details(id):
                            Text("details \(id)")
                        }
                    }
                }
            }
        }
        .onAppear { withAnimation { viewModel.loadData() } }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
