import SwiftUI
import Core_Resources

struct LoadMoreView: View {
    let isLoading: Bool
    let onLoadMore: () -> Void
    
    var body: some View {
        GeometryReader { proxy in
            if isLoading == false &&
                proxy.frame(in: .global).minY < UIScreen.main.bounds.height - 200 {
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
}

struct LoadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreView(isLoading: false, onLoadMore: {})
    }
}
