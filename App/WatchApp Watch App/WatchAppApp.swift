import SwiftUI
import Movies_Feature

@main
struct WatchApp_Watch_AppApp: App {
    init() { AppModules.initContainer() }
    
    var body: some Scene {
        WindowGroup {
            NowPlayingView()
        }
    }
}
