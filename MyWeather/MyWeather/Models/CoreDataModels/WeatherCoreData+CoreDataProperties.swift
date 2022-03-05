//
//  WeatherCoreData+CoreDataProperties.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//
//

import Foundation
import CoreData


extension WeatherCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherCoreData> {
        return NSFetchRequest<WeatherCoreData>(entityName: "WeatherCoreData")
    }

    @NSManaged public var active: Bool
    @NSManaged public var city: String?
    @NSManaged public var current: CurrentCoreData?
    @NSManaged public var hourly: NSSet?
    @NSManaged public var daily: NSSet?

}

// MARK: Generated accessors for hourly
extension WeatherCoreData {

    @objc(addHourlyObject:)
    @NSManaged public func addToHourly(_ value: CurrentCoreData)

    @objc(removeHourlyObject:)
    @NSManaged public func removeFromHourly(_ value: CurrentCoreData)

    @objc(addHourly:)
    @NSManaged public func addToHourly(_ values: NSSet)

    @objc(removeHourly:)
    @NSManaged public func removeFromHourly(_ values: NSSet)

}

// MARK: Generated accessors for daily
extension WeatherCoreData {

    @objc(addDailyObject:)
    @NSManaged public func addToDaily(_ value: DailyCoreData)

    @objc(removeDailyObject:)
    @NSManaged public func removeFromDaily(_ value: DailyCoreData)

    @objc(addDaily:)
    @NSManaged public func addToDaily(_ values: NSSet)

    @objc(removeDaily:)
    @NSManaged public func removeFromDaily(_ values: NSSet)

}

extension WeatherCoreData : Identifiable {

}
