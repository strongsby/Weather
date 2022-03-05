//
//  WeatherResponseDelegate.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 18.02.22.
//

import Foundation

protocol WeatherDelegate {
    func getWeather(weather: WeatherResponse)
}
