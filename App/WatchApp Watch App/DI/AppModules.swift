import Foundation
import Swinject
import CoreData
import Core_Providers
import Core_Resources
import Movies_Feature
import Movies_Feature_Repository
import Movies_Feature_Repository_Live
import WatchKit

struct AppModules {
    static let container = FeaturesInjection.container
    
    static func initContainer() {
        // Externals
        container.register(NetworkManager.self) { _ in Server() }
        container.register(NSManagedObjectContext.self) { _ in PersistenceController.shared.container.viewContext }
        container.register(DeviceSizeType.self) { _ in .watch(WKInterfaceDevice.current().screenBounds.height) }
        
        // MoviesFeature
        container.register(MoviesEndpoints.self) { r in MoviesEndpoints(server: r.resolve(NetworkManager.self)!) }
        container.register(MoviesService.self) { r in MoviesService.live(endpoint: r.resolve(MoviesEndpoints.self)!) }
        container.register(NowPlayingViewModel.self) { r in NowPlayingViewModel(service: r.resolve(MoviesService.self)!) }
        container.register(MoviesRoutesViewModel.self) { r in MoviesRoutesViewModel() }
    }
}
