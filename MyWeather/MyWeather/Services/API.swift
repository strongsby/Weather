//
//  API.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import Foundation

struct API {
    let key = "8f2c2a9856f6696c61f99b0dba6a1fe7"                 //"cbfd7f210b879f8e809c8b4314bc51dd"
    let baseURLString = "https://api.openweathermap.org/data/2.5/onecall?"
     func getURLStringFor(lat: Double, lon: Double) -> String {
        return "\(self.baseURLString)lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=\(self.key)"
    }
}
