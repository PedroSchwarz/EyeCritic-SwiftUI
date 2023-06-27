import Foundation
import Swinject
import CoreData
import Core_Providers
import Core_Resources
import Home_Feature
import Home_Feature_Repository
import Home_Feature_Repository_Live

struct AppModules {
    static let container = FeaturesInjection.container
    
    static func initContainer() {
        // Externals
        container.register(NetworkManager.self) { _ in Server() }
        container.register(NSManagedObjectContext.self) { _ in PersistenceController.shared.container.viewContext }
        
        // Services
        container.register(HomeService.self) { r in HomeService.live(server: r.resolve(NetworkManager.self)!) }
        
        // ViewModel
        container.register(HomeViewModel.self) { r in HomeViewModel(service: r.resolve(HomeService.self)!) }
    }
}
