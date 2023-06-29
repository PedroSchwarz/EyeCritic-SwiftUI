import SwiftUI
import Core_Resources
import Swinject

public struct NowPlayingView: View {
    @StateObject private var viewModel: NowPlayingViewModel =
    FeaturesInjection.container.resolve(NowPlayingViewModel.self)!
    
    public init() {}
    
    public var body: some View {
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
                            FeaturedMovieSectionView(
                                movie: viewModel.state.movies.first!
                            )
                        }
                        
                        PlatformWrapper(
                            iOS: {
                                ItemsGridView(
                                    items: Array(viewModel.state.movies.dropLast()),
                                    content: { MovieCardView(movie: $0) }
                                )
                            },
                            watchOS: {
                                ForEach(viewModel.state.movies) {
                                    MovieCardView(movie: $0, height: 150)
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
