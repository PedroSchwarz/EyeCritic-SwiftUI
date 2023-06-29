import SwiftUI
import Core_Providers
import Home_Feature
import Swinject

@main
struct MainApp: App {
    init() { AppModules.initContainer() }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
