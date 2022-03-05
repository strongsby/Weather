//
//  Cell.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 15.02.22.
//

import UIKit

final class Cell: UITableViewCell {
    
    // MARK: - Properties
    
    static var identifare = "\(Cell.self)"
    
    private lazy var nameCityLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 35)
        lable.text = "--"
        lable.textAlignment = .center
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var temperatureLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 40)
        lable.text = "--"
        lable.textAlignment = .center
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var descriptionLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 20)
        lable.text = "--"
        lable.textAlignment = .center
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    // MARK: - Setups
    
    private func viewAddSubView(){
        self.addSubview(nameCityLable)
        self.addSubview(temperatureLable)
        self.addSubview(descriptionLable)
    }
    
    private func setupAnchors(){
        NSLayoutConstraint.activate([
            nameCityLable.topAnchor.constraint(equalTo: topAnchor),
            nameCityLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameCityLable.rightAnchor.constraint(equalTo: temperatureLable.leftAnchor, constant: -16),
            nameCityLable.heightAnchor.constraint(equalTo: descriptionLable.heightAnchor),
            nameCityLable.bottomAnchor.constraint(equalTo: descriptionLable.topAnchor),
            
            temperatureLable.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            temperatureLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            temperatureLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            temperatureLable.heightAnchor.constraint(equalTo: heightAnchor),
            temperatureLable.widthAnchor.constraint(equalToConstant: bounds.width / 3),
            
            descriptionLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLable.rightAnchor.constraint(equalTo: temperatureLable.leftAnchor, constant: -16),
            descriptionLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            descriptionLable.heightAnchor.constraint(equalTo: nameCityLable.heightAnchor)
        ])
    }
    
    private func setupAll(){
        viewAddSubView()
        setupAnchors()
    }
    
    // MARK: - Override Init / PrepareForReuse
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .cellsBackColor
        layer.borderWidth = 2
        setupAll()
    }
    
    override func prepareForReuse() {
        self.nameCityLable.text = nil
        self.temperatureLable.text = nil
        self.descriptionLable.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    
    func updateAll(weatherResponce: WeatherCoreData){
        if let city = weatherResponce.city, let temp = weatherResponce.current?.temp, let description = weatherResponce.current?.attribute {
            self.nameCityLable.text = weatherResponce.active ? "Current place" : String(city)
        self.temperatureLable.text = String(format: "%.1f°", temp)
        self.descriptionLable.text = description
        }
    }
}




