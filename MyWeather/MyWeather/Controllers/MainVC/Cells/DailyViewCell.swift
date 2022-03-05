//
//  DailyViewCell.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import UIKit

final class DailyViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var identifare = "\(DailyViewCell.self)"
    
    private let dayLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        return lable
    }()
    
    private let dayImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let minTepLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = .white
        return lable
    }()
    
    private let maxTempLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = .white
        return lable
    }()
    
    // MARK: - Setups
    
    private func viewAddSubView(){
        self.addSubview(dayLable)
        self.addSubview(dayImage)
        self.addSubview(minTepLable)
        self.addSubview(maxTempLable)
    }
    
    private func setupAnchors(){
        self.dayLable.translatesAutoresizingMaskIntoConstraints = false
        self.dayImage.translatesAutoresizingMaskIntoConstraints = false
        self.minTepLable.translatesAutoresizingMaskIntoConstraints = false
        self.maxTempLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // dayLable
            self.dayLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            self.dayLable.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.dayLable.widthAnchor.constraint(equalTo: self.minTepLable.widthAnchor),
            // dayImage
            self.dayImage.leftAnchor.constraint(equalTo: self.dayLable.rightAnchor, constant: 5),
            self.dayImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.dayImage.widthAnchor.constraint(equalTo: self.heightAnchor),
            // minTepLable
            self.minTepLable.leftAnchor.constraint(equalTo: self.dayImage.rightAnchor, constant: 5),
            self.minTepLable.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.minTepLable.widthAnchor.constraint(equalTo: self.maxTempLable.widthAnchor),
            // maxTepLable
            self.maxTempLable.leftAnchor.constraint(equalTo: self.minTepLable.rightAnchor, constant: 5),
            self.maxTempLable.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.maxTempLable.widthAnchor.constraint(equalTo: self.dayLable.widthAnchor),
            self.maxTempLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5)
        ])
        
    }
   
    // MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cellsBackColor
        viewAddSubView()
        setupAnchors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    
    func updateAll(daily: DailyCoreData, indexPath: IndexPath ) {
        if let icon = daily.icon {
            self.dayLable.text = DateFormatter().getDayString(intervaleFrom1970: daily.da)
            self.dayImage.image = UIImage(named: icon)
            self.minTepLable.text = String(format: "От %.1f°", daily.tmpMin)
            self.maxTempLable.text = String(format: "до %.1f°", daily.tempMax)
        }
        if indexPath.row == 7 {
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
    }
   
}

















//
//
//
//import UIKit
//
//class DailyViewCell: UICollectionViewCell {
//
//    static var identifare = "\(DailyViewCell.self)"
//
//    let dayLable: UILabel = {
//        let lable = UILabel()
//        return lable
//    }()
//
//    let dayImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        return image
//    }()
//
//    let minTepLable: UILabel = {
//        let lable = UILabel()
//        lable.textAlignment = .center
//        return lable
//    }()
//
//    let maxTempLable: UILabel = {
//        let lable = UILabel()
//        lable.textAlignment = .center
//        return lable
//    }()
//
//    private func viewAddSubView(){
//        self.addSubview(dayLable)
//        self.addSubview(dayImage)
//        self.addSubview(minTepLable)
//        self.addSubview(maxTempLable)
//    }
//
//    private func setupAnchors(){
//        self.dayLable.translatesAutoresizingMaskIntoConstraints = false
//        self.dayImage.translatesAutoresizingMaskIntoConstraints = false
//        self.minTepLable.translatesAutoresizingMaskIntoConstraints = false
//        self.maxTempLable.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            // dayLable
//            self.dayLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
//            self.dayLable.heightAnchor.constraint(equalTo: self.heightAnchor),
//            self.dayLable.widthAnchor.constraint(equalTo: self.minTepLable.widthAnchor),
//            // dayImage
//            self.dayImage.leftAnchor.constraint(equalTo: self.dayLable.rightAnchor, constant: 5),
//            self.dayImage.heightAnchor.constraint(equalTo: self.heightAnchor),
//            self.dayImage.widthAnchor.constraint(equalTo: self.heightAnchor),
//            // minTepLable
//            self.minTepLable.leftAnchor.constraint(equalTo: self.dayImage.rightAnchor, constant: 5),
//            self.minTepLable.heightAnchor.constraint(equalTo: self.heightAnchor),
//            self.minTepLable.widthAnchor.constraint(equalTo: self.maxTempLable.widthAnchor),
//            // maxTepLable
//            self.maxTempLable.leftAnchor.constraint(equalTo: self.minTepLable.rightAnchor, constant: 5),
//            self.maxTempLable.heightAnchor.constraint(equalTo: self.heightAnchor),
//            self.maxTempLable.widthAnchor.constraint(equalTo: self.dayLable.widthAnchor),
//            self.maxTempLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5)
//        ])
//
//    }
//
//    func updateAll(daily: Daily) {
//        self.dayLable.text = DateFormatter().getDayString(intervaleFrom1970: daily.dt)
//        self.dayImage.image = UIImage(named: daily.weather[0].icon)
//        self.minTepLable.text = String(format: "От %.1f°", daily.temp.min)
//        self.maxTempLable.text = String(format: "до %.1f°", daily.temp.max)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
//        viewAddSubView()
//        setupAnchors()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}
