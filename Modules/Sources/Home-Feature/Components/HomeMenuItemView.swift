import SwiftUI

struct HomeMenuItemView: View {
    let currentSection: HomeSection
    let section: HomeSection
    let onSelected: (HomeSection) -> Void
    let title: String
    
    var body: some View {
        Button(
            action: { onSelected(section) },
            label: {
                HStack {
                    Text(title)
                        .foregroundColor(currentSection == section ? .blue : .primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: .s_xs, height: .s_m)
                        .foregroundColor(.primary)
                }
            }
        )
    }
}

struct HomeMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuItemView(
            currentSection: .movies,
            section: .movies,
            onSelected: { _ in },
            title: "Movies"
        )
    }
}
