import SwiftUI

public struct ItemsGridView<T, Content>: View where T : Identifiable, Content : View {
    let items: [T]
    let content: (T) -> Content
    
    public init(items: [T], content: @escaping (T) -> Content) {
        self.items = items
        self.content = content
    }
    
    public var body: some View {
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
        ItemsGridView<MockModel, Text>(
            items: [.mock],
            content: {
                Text($0.title)
            }
        )
    }
    
    struct MockModel: Identifiable {
        let id: Int
        let title: String
        
        static let mock: Self = .init(id: 1, title: "")
    }
}
