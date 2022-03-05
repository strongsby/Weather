//
//  GlobalSettings.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 22.02.22.
//

import Foundation
import UIKit

struct HeadersDefault {
    
    static var size = CGSize(width: UIScreen.main.bounds.width - 10, height: 35)
    
    static func title(section: Headers) -> String {
        switch section {
        case .first: return "weather for 24 hours"
        case .secand: return "weather for 7 days"
        }
    }
    
    static func image(section: Headers) -> UIImage {
        switch section {
        case .first: return UIImage(systemName: "clock") ?? UIImage()
        case .secand: return UIImage(systemName: "calendar.badge.clock") ?? UIImage()
        }
    }
    
    enum Headers {
        case first, secand
    }
}

struct SectionDefault {
    static var numberOfSections = 2
    static var minimumLineSpacing: CGFloat = 1
    static var edgeInsets = UIEdgeInsets(top: 1.0, left: 0.0, bottom: 10.0, right: 0.0)
        
    static func size(forSection: SizeForItems) -> CGSize{
        switch forSection {
        case .first:
            return CGSize(width: UIScreen.main.bounds.width - 10,
                        height: UIScreen.main.bounds.height / 6)
        case .secand:
            return CGSize(width: UIScreen.main.bounds.width - 10,
                        height: UIScreen.main.bounds.height / 10)
        }
    }
        
    enum SizeForItems {
        case first, secand
    }
}
