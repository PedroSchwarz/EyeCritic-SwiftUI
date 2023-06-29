import SwiftUI
import Combine
import Movies_Feature_Repository

public class NowPlayingViewModel: ObservableObject {
    let service: MoviesService
    
    @Published private(set) var state: State = .init()
    private var cancellables = Set<AnyCancellable>()
    
    public init(service: MoviesService) { self.service = service }
    
    func loadData() {
        let nextPage = state.currentPage + 1
        state.isLoading = true
        service
            .getNowPlaying(nextPage)
            .delay(for: 2, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] status in
                    switch status {
                    case let .failure(error):
                        self?.state.isLoading = false
                        self?.state.errorMessage = error.localizedDescription
                        break
                    default:
                        break
                    }
                },
                receiveValue: { [weak self] result in
                    self?.state.movies.append(contentsOf: result.results)
                    self?.state.currentPage = nextPage
                    self?.state.isLoading = false
                }
            )
            .store(in: &cancellables)
    }
}

