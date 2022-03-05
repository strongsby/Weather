//
//  TableView+Reusable.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 2.03.22.
//

import UIKit


extension UITableView {
    
    func dequeueReusableCell<CellType: UITableViewCell>(with type: CellType, indexPath: IndexPath) -> CellType {
        return self.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as! CellType
    }
}

