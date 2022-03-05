//
//  HourlyViewCellCell.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import UIKit

final class HourlyViewCellCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifare = "\(HourlyViewCellCell.self)"
    
   private var timeLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = .white
        return lable
    }()
    private var UIimageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private var tempLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = .white
        return lable
    }()
    
    // MARK: - Setups
    
    private func viewAddSubView(){
        self.addSubview(timeLable)
        self.addSubview(UIimageView)
        self.addSubview(tempLable)
    }

    
    
    private func setupAnchors(){
        timeLable.translatesAutoresizingMaskIntoConstraints = false
        UIimageView.translatesAutoresizingMaskIntoConstraints = false
        tempLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // timeLable
            timeLable.topAnchor.constraint(equalTo: topAnchor),
            timeLable.leftAnchor.constraint(equalTo: leftAnchor),
            timeLable.rightAnchor.constraint(equalTo: rightAnchor),
            timeLable.heightAnchor.constraint(equalTo: UIimageView.heightAnchor),
            // UIimageView
            UIimageView.topAnchor.constraint(equalTo: timeLable.bottomAnchor),
            UIimageView.leftAnchor.constraint(equalTo: leftAnchor),
            UIimageView.rightAnchor.constraint(equalTo: rightAnchor),
            UIimageView.bottomAnchor.constraint(equalTo: tempLable.topAnchor),
            UIimageView.heightAnchor.constraint(equalTo: tempLable.heightAnchor),
            // tempLable
            tempLable.leftAnchor.constraint(equalTo: leftAnchor),
            tempLable.rightAnchor.constraint(equalTo: rightAnchor),
            tempLable.bottomAnchor.constraint(equalTo: bottomAnchor),
            tempLable.heightAnchor.constraint(equalTo: timeLable.heightAnchor)
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
    
    // MARK: - funcs
    
    func updateAll(hourlyArray: CurrentCoreData){
        if let icon = hourlyArray.icon{
            timeLable.text = DateFormatter().getHourString(intervaleFrom1970: hourlyArray.date)
            UIimageView.image = UIImage(named: icon)
            tempLable.text = String(format: "%.1f°", hourlyArray.temp)
        }
    }
}


