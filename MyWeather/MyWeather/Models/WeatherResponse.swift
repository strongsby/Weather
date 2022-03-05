

import Foundation


// MARK: - WeatherResponse

struct WeatherResponse: Codable {
    
    var city: String?
    var current: Current?
    var hourly: [Current]?
    var daily: [Daily]?
    
    enum CodingKeys: String, CodingKey {
        case city
        case current
        case hourly
        case daily
    }
}


// MARK: - Current

struct Current: Codable {
    
    var dt: Double?
    var temp: Double?
    var weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}


// MARK: - Weather

struct Weather: Codable {
    
    var description: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case description
        case icon
    }
}


// MARK: - Daily

struct Daily: Codable {
    
    var dt: Double?
    var temp: Temp?
    var weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}


// MARK: - Temp

struct Temp: Codable {
    
    var max: Double?
    var min: Double?
    
    enum CodingKeys: String, CodingKey {
        case max
        case min
    }
}




































extension WeatherResponse {
    func createCoreDataWeather(active: Bool, complition: ((WeatherCoreData) -> Void)?) {
        guard let coreDataWeather = WeatherCoreData(moc: CoreDataService.shared.managedObjectContext) else { return }
        coreDataWeather.city = self.city
        coreDataWeather.active = active
        let curent = CurrentCoreData(moc: CoreDataService.shared.managedObjectContext)
        if let temp = self.current?.temp, let icon = self.current?.weather?[0].icon, let attribute = self.current?.weather?[0].description {
            curent?.icon = icon
            curent?.attribute = attribute
            curent?.temp = temp
            coreDataWeather.current = curent
        } else {
            coreDataWeather.current = nil
        }
        if let dailyArray = self.daily {
            coreDataWeather.daily = NSSet(array: dailyArray.compactMap({ daily in
            let newdailyCoreData = DailyCoreData(moc: CoreDataService.shared.managedObjectContext)
            newdailyCoreData?.da = daily.dt ?? 0.0
            newdailyCoreData?.attribute = daily.weather?[0].description
            newdailyCoreData?.tempMax = daily.temp?.max ?? 0.0
            newdailyCoreData?.tmpMin = daily.temp?.min ?? 0.0
            newdailyCoreData?.icon = daily.weather?[0].icon
            return newdailyCoreData
        }))
        } else {
            coreDataWeather.daily = nil
        }
        if let hourlyArray = self.hourly {
            coreDataWeather.hourly = NSSet(array: hourlyArray.compactMap({ hourly in
                let newHourly = CurrentCoreData(moc: CoreDataService.shared.managedObjectContext)
                newHourly?.icon = hourly.weather?[0].icon
                newHourly?.temp = hourly.temp ?? 0.0
                newHourly?.attribute = hourly.weather?[0].description
                newHourly?.date = hourly.dt ?? 0.0
                return newHourly
            }))
        } else {
            coreDataWeather.hourly = nil
        }
        guard let complition = complition else {
            return
        }
        complition(coreDataWeather)

    }
}

