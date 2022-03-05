//
//  CurrentCoreData+CoreDataProperties.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//
//

import Foundation
import CoreData


extension CurrentCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrentCoreData> {
        return NSFetchRequest<CurrentCoreData>(entityName: "CurrentCoreData")
    }

    @NSManaged public var date: Double
    @NSManaged public var temp: Double
    @NSManaged public var attribute: String?
    @NSManaged public var icon: String?

}

extension CurrentCoreData : Identifiable {

}
