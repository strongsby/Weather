//
//  NSSet.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 28.02.22.
//

import Foundation

extension NSSet {

    func toArray<S>(_ of: S.Type) -> [S] {
        let array = self .allObjects.map({$0 as! S})
        return array
    }

}
