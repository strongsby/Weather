//
//  CurrentCoreData+CoreDataClass.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//
//

import Foundation
import CoreData

@objc(CurrentCoreData)
public class CurrentCoreData: NSManagedObject {

    convenience init?(moc: NSManagedObjectContext){
        if let entity = NSEntityDescription.entity(forEntityName: "CurrentCoreData", in: moc){
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
}
