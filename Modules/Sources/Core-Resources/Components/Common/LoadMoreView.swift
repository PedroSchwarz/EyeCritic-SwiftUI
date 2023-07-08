import SwiftUI
import Foundation

public struct LoadMoreView: View {
    let isLoading: Bool
    let onLoadMore: () -> Void
    let deviceSize: DeviceSizeType =
    FeaturesInjection.container.resolve(DeviceSizeType.self)!
    
    public init(isLoading: Bool, onLoadMore: @escaping () -> Void) {
        self.isLoading = isLoading
        self.onLoadMore = onLoadMore
    }
    
    public var body: some View {
        GeometryReader { proxy in
            if isLoading == false &&
                getShouldLoadMoreOnScrollDistance(for: proxy.frame(in: .global).minY) {
                VStack {}.onAppear {  withAnimation { onLoadMore() } }
            } else if isLoading {
                HStack() {
                    Spacer()
                    ProgressView().transition(.opacity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, .s_xl)
    }
    
    private func getShouldLoadMoreOnScrollDistance(for minY: CGFloat) -> Bool {
        switch deviceSize {
        case .iPhone(let height):
            return minY < height - 150
        case .watch(let height):
            return minY < height - 100
        }
    }
}

struct LoadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreView(isLoading: false, onLoadMore: {})
    }
}
