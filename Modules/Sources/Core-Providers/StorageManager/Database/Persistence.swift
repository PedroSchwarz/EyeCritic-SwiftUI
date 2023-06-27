import CoreData

public struct PersistenceController {
    public static let shared = PersistenceController()

    public let container: NSPersistentContainer

    public init(inMemory: Bool = false) {
        let bundle = Bundle.module
        let moduleURL = bundle.url(forResource: "MainApp", withExtension: ".momd")!
        let model = NSManagedObjectModel(contentsOf: moduleURL)!
        container = NSPersistentContainer(name: "MainApp", managedObjectModel: model)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
