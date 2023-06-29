import SwiftUI
import Kingfisher

public struct ImageView: View {
    let image: String?
    let height: CGFloat
    
    public init(image: String? = nil, height: CGFloat) {
        self.image = image
        self.height = height
    }
    
    public var body: some View {
        if let image = image, let url = URL(string: image) {
            GeometryReader { proxy in
                KFImage.url(url)
                    .placeholder({
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(Color.secondary.opacity(0.2))
                    })
                    .cacheMemoryOnly()
                    .fade(duration: 0.1)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: proxy.frame(in: .global).width, maxHeight: height)
                    .clipShape(RoundedRectangle(cornerRadius: .s_m))
            }
            .frame(height: height)
        } else {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(height: 250)
    }
}
