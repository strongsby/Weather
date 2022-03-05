//
//  DateFormator.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import Foundation


extension DateFormatter {
    
    func getHourString(intervaleFrom1970: Double) -> String {
        
        let needDateComponents = Calendar.current.dateComponents([.hour, .day], from: Date(timeIntervalSince1970: intervaleFrom1970))
        let nowDateComponents = Calendar.current.dateComponents([.hour, .day], from: Date())

        if needDateComponents.hour == nowDateComponents.hour &&
            needDateComponents.day == nowDateComponents.day {
            return "Now"
        }
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = "HH"
        return dateFormator.string(from: Date(timeIntervalSince1970: intervaleFrom1970))
    }
    
    func getDayString(intervaleFrom1970: Double) -> String {
        
        let needDateComponents = Calendar.current.dateComponents([.weekday, .day], from: Date(timeIntervalSince1970: intervaleFrom1970))
        let nowDateComponents = Calendar.current.dateComponents([.weekday, .day,], from: Date())
        
        if needDateComponents.weekday == nowDateComponents.weekday &&
            needDateComponents.day == nowDateComponents.day {
            return "Today"
        }
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = "EEEE"
        return dateFormator.string(from: Date(timeIntervalSince1970: intervaleFrom1970)).capitalized
    }
}
