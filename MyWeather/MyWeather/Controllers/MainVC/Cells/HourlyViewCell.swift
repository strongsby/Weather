

import UIKit

final class HourlyViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var identifare = "\(HourlyViewCell.self)"
    var hourlyArray = [CurrentCoreData]()
    private var collectionView: UICollectionView!
    
    // MARK: - Setups
    
    private func setupCollectionView(){
        let layoutsss = UICollectionViewFlowLayout()
        layoutsss.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutsss)
        collectionView.backgroundColor = .cellsBackColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 15
        collectionView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionViewRegisterCell()
        addSubview(collectionView)

    }
    
    private func viewAddSubView(){
        self.addSubview(collectionView)
    }
    
    private func collectionViewRegisterCell(){
        collectionView.register(HourlyViewCellCell.self, forCellWithReuseIdentifier: HourlyViewCellCell.identifare)
    }
    
    private func setupAnchors(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // collectionView
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateAll(hourlyArray: [CurrentCoreData]){
        self.hourlyArray = hourlyArray
        self.collectionView.reloadData()
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    // MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        viewAddSubView()
        setupAnchors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HourlyViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyViewCellCell.identifare, for: indexPath) as! HourlyViewCellCell
        cell.updateAll(hourlyArray: self.hourlyArray[indexPath.item])
        return cell
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension HourlyViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.bounds.width - 10) / 5, height: self.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
