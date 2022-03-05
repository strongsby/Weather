//
//  TodayCell.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import UIKit
//
//class TodayCell: UICollectionViewCell {
//    
//    static var identifare = "\(TodayCell.self)"
//
//    private lazy var nameCityLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 35)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//    
//    private lazy var temperatureLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 75)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//    
//    private lazy var descriptionLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 20)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//    
//    
//    private func viewAddSubView(){
//        self.addSubview(nameCityLable)
//        self.addSubview(temperatureLable)
//        self.addSubview(descriptionLable)
//    }
//
//    
//    
//    private func setupAnchors(){
//        NSLayoutConstraint.activate([
//            nameCityLable.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            nameCityLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            nameCityLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            nameCityLable.heightAnchor.constraint(equalTo: temperatureLable.heightAnchor),
//            
//            temperatureLable.topAnchor.constraint(equalTo: nameCityLable.bottomAnchor, constant: 5),
//            temperatureLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            temperatureLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            temperatureLable.bottomAnchor.constraint(equalTo: descriptionLable.topAnchor, constant: 5),
//            temperatureLable.heightAnchor.constraint(equalTo: descriptionLable.heightAnchor),
//            
//            descriptionLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            descriptionLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            descriptionLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
//            descriptionLable.heightAnchor.constraint(equalTo: nameCityLable.heightAnchor)
//        ])
//    }
//    
//    func updateAll(weatherResponce: WeatherResponse){
//        //let city = weatherResponce.timezone != "" ? weatherResponce.timezone?.split(separator: "/")[1] : "--"
//        if let city = "", let temp = weatherResponce.current?.temp, let description = weatherResponce.current?.weather?[0].description {
//        self.nameCityLable.text = String(city)
//        self.temperatureLable.text = String(format: "%.1f°", temp)
//        self.descriptionLable.text = description
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        
//        self.backgroundColor = .clear //UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
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
//
//
//







//
//import UIKit
//
//class TodayCell: UICollectionViewCell {
//
//    static var identifare = "\(TodayCell.self)"
//
//    private lazy var nameCityLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 35)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private lazy var temperatureLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 75)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private lazy var descriptionLable: UILabel = {
//        let lable = UILabel()
//        lable.font = .systemFont(ofSize: 20)
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//
//    private func viewAddSubView(){
//        self.addSubview(nameCityLable)
//        self.addSubview(temperatureLable)
//        self.addSubview(descriptionLable)
//    }
//
//
//
//    private func setupAnchors(){
//        NSLayoutConstraint.activate([
//            nameCityLable.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            nameCityLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            nameCityLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            nameCityLable.heightAnchor.constraint(equalTo: temperatureLable.heightAnchor),
//
//            temperatureLable.topAnchor.constraint(equalTo: nameCityLable.bottomAnchor, constant: 5),
//            temperatureLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            temperatureLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            temperatureLable.bottomAnchor.constraint(equalTo: descriptionLable.topAnchor, constant: 5),
//            temperatureLable.heightAnchor.constraint(equalTo: descriptionLable.heightAnchor),
//
//            descriptionLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            descriptionLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
//            descriptionLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
//            descriptionLable.heightAnchor.constraint(equalTo: nameCityLable.heightAnchor)
//        ])
//    }
//
//    func updateAll(weatherResponce: WeatherResponse){
//        let city = weatherResponce.timezone != "" ? weatherResponce.timezone.split(separator: "/")[1] : "--"
//        self.nameCityLable.text = String(city)
//        self.temperatureLable.text = String(format: "%.1f°", weatherResponce.current.temp)
//        self.descriptionLable.text = weatherResponce.current.weather[0].description
//
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//        self.backgroundColor = .clear //UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
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
//
//
//




























//    private var cityLable: UILabel!
//    private var tempLable: UILabel!
//    private var cloudsLable: UILabel!
//    private va
//
//    private lazy var nameCityLable: UILabel = {
//        let lable = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 7, width: self.bounds.width, height: self.bounds.height / 7))
//        lable.font = .systemFont(ofSize: 35)
//        lable.textAlignment = .center
//        //lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private lazy var temperatureLable: UILabel = {
//        let lable = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 7 * 2, width: self.bounds.width, height: self.bounds.height / 7 * 3))
//        lable.font = .systemFont(ofSize: 75)
//        lable.textAlignment = .center
//        //lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private lazy var descriptionLable: UILabel = {
//        let lable = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 7 * 5, width: self.bounds.width, height: self.bounds.height / 7))
//        lable.font = .systemFont(ofSize: 20)
//        lable.textAlignment = .center
//        //lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private lazy var minMaxLable: UILabel = {
//        let lable = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 7 * 6, width: self.bounds.width, height: self.bounds.height / 7)) // нет в респонсе мин макс на сегодня
//        lable.font = .systemFont(ofSize: 20)
//        lable.textAlignment = .center
//        //lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()
//
//    private func setupAll(){
//        self.addSubview(nameCityLable)
//        self.addSubview(temperatureLable)
//        self.addSubview(descriptionLable)
//        self.addSubview(minMaxLable)
//
//    }
    
