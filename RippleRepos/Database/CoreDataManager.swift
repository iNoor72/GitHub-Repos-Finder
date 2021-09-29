//
//  CoreDataManager.swift
//  Ripple-Task
//
//  Created by Noor Walid on 27/09/2021.
//

import UIKit
import CoreData

class CoreDataManager: Database {
    static let shared = CoreDataManager()
    private init() {}
    
    private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.coredataModelID)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save() {
        do {
            if persistentContainer.viewContext.hasChanges {
                try persistentContainer.viewContext.save()
            }
        }catch {
            print("There was an error saving your new data into the context. \(error)")
        }
    }
    
    func fetch() -> [RepoModel] {
        var repos : [RepoModel]?
        do {
            repos = try persistentContainer.viewContext.fetch(RepoModel.fetchRequest())
        } catch {
            print("There was an error fetching your logs from the context. \(error)")
        }
        
        return repos ?? [RepoModel]()
    }
    
    
    
}
