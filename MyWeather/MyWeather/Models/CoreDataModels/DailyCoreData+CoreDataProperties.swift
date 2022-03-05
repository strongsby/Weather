//
//  DailyCoreData+CoreDataProperties.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//
//

import Foundation
import CoreData


extension DailyCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyCoreData> {
        return NSFetchRequest<DailyCoreData>(entityName: "DailyCoreData")
    }

    @NSManaged public var da: Double
    @NSManaged public var tmpMin: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var attribute: String?
    @NSManaged public var icon: String?

}

extension DailyCoreData : Identifiable {

}
