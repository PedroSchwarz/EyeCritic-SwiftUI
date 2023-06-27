import SwiftUI
import Kingfisher
import Core_Resources

struct MovieImageView: View {
    let image: String?
    let height: CGFloat
    
    init(image: String? = nil, height: CGFloat = 250) {
        self.image = image
        self.height = height
    }
    
    var body: some View {
        if let image = image, let url = URL(string: image) {
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
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: height)
                .clipShape(RoundedRectangle(cornerRadius: .s_m))
        } else {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView()
    }
}
