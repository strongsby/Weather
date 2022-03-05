//
//  AlertHandler.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 27.02.22.
//

import Foundation
import UIKit

protocol AlertHandler where Self: UIViewController { }

extension AlertHandler {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
}
