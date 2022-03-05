//
//  SectionHeader.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import UIKit

final class SectionHeader: UICollectionReusableView {

    // MARK: - Properties
    
    static let reuseIdentifier = "header"
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .left
        return label
        }()
    
    // MARK: - Setups
    
    private func viewAddSubview(){
        addSubview(label)
        addSubview(image)
    }
    
    private func setupAnchors(){
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // image
            image.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            image.widthAnchor.constraint(equalToConstant: bounds.height * 2),
            // label
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupAll(){
        viewAddSubview()
        setupAnchors()
    }

    // MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAll()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - funcs
    
    func configurateHeader(text: String, headerImage: UIImage){
        label.text = text
        image.image = headerImage
        self.layer.cornerRadius = 15.0
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.backgroundColor = .sectionHeaderBackColor
        }
    }
