import SwiftUI
import Core_Resources

public struct HomeMenuView: View {
    let currentSection: HomeSection
    let onSectionSelected: (HomeSection) -> Void
    let onCloseMenu: () -> Void
    
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: .s_l) {
                        Button(
                            action: onCloseMenu,
                            label: { Image(systemName: "xmark") }
                        )
                        .foregroundColor(.primary)
                        .padding(.bottom, .s_l)
                        
                        ForEach(HomeSection.allCases, id: \.self) { section in
                            HomeMenuItemView(
                                currentSection: currentSection,
                                section: section,
                                onSelected: onSectionSelected,
                                title: section.title
                            )
                        }
                    }
                    .padding(.all)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .background(.thickMaterial)
            .frame(maxWidth: proxy.size.width / 1.5)
            .shadow(radius: 10, x: 10)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView(
            currentSection: .movies,
            onSectionSelected: { _ in },
            onCloseMenu: { }
        )
    }
}
