//
//  CoreDataService.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//

import Foundation
import CoreData
import UIKit

final class CoreDataService {
    
    static var shared = CoreDataService()
    
    private init() {}

    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MyWeather")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


