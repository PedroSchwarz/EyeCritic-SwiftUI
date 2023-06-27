import SwiftUI
import Movies_Feature_Repository

struct ItemsGridView<T, Content>: View where T : Identifiable, Content : View {
    let items: [T]
    let content: (T) -> Content
    
    var body: some View {
        LazyVGrid(columns: Array.init(repeating: GridItem(.flexible(), spacing: 0), count: 2)) {
            ForEach(items) { item in
                content(item)
                    .padding(.horizontal, .s_s)
            }
        }
        .padding(.vertical, .s_l)
    }
}

struct ItemsGridView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsGridView<Movie, Text>(
            items: [.mock],
            content: {
                Text($0.title)
            }
        )
    }
}
