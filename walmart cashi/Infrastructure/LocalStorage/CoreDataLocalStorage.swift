//
//  CoreDataLocalStorage.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import CoreData

protocol CoreDataMapper {
    func toEntity(in context: NSManagedObjectContext) -> NSManagedObject
}

final class CoreDataLocalStorage {
    static let shared = CoreDataLocalStorage()
    
    private init() {}
    
    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "walmart_cashi")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
    
    func fetch<E>(request: NSFetchRequest<E>) async throws -> [E] where E: NSManagedObject {
        let context = persistentContainer.viewContext
        return try await context.perform {
            try context.fetch(request)
        }
    }
    
    func save<E>(_ objects: [E]) async throws where E: CoreDataMapper {
        let context = persistentContainer.viewContext
        return try await context.perform {
            let coreDataObjects = objects.map { $0.toEntity(in: context) }
            try context.save()
        }
    }
}
