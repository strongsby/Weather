//
//  collectionView+Reusable.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 1.03.22.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<CellType: UICollectionViewCell>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        return dequeueReusableCell(withReuseIdentifier: "\(CellType.self)", for: indexPath) as! CellType
    }
    
}
