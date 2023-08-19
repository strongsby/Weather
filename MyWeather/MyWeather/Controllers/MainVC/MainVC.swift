

import UIKit
import CoreLocation
import CoreData

//Some comment for test

final class MainVC: UIViewController {

    // MARK: - Properties

    private var nameCityLable: UILabel!
    private var temperatureLable: UILabel!
    private var descriptionLable: UILabel!
    private var cancelButton: UIButton!
    private var addButton: UIButton!
    private var bar: UINavigationBar!
    private var collectionView: UICollectionView!
    var viewModel: MainViewModelProtocol = MainViewModel()

    // MARK: - Setups

    private func setupCancelButton(){
        self.cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.layer.cornerRadius = 5
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cancelButton.backgroundColor = .buttonsBackColor
        cancelButton.titleLabel?.textColor = .white
        cancelButton.isHidden = viewModel.updateLocation
        cancelButton.addTarget(self, action: #selector(cancelDidTapped), for: .touchUpInside)
    }

    private func setupAddButton(){
        self.addButton = UIButton()
        addButton.setTitle("add", for: .normal)
        addButton.layer.cornerRadius = 5
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        addButton.backgroundColor = .buttonsBackColor
        addButton.titleLabel?.textColor = .white
        addButton.isHidden = viewModel.updateLocation
        addButton.addTarget(self, action: #selector(addDidTapped), for: .touchUpInside)
    }

    private func setupNameCityLable() {
        self.nameCityLable = UILabel()
        nameCityLable.font = .systemFont(ofSize: 35)
        nameCityLable.text = ""
        nameCityLable.textColor = .white
        nameCityLable.textAlignment = .center
    }

    private func setupTemperatureLable() {
        self.temperatureLable = UILabel()
        temperatureLable.font = .systemFont(ofSize: 75)
        temperatureLable.text = ""
        temperatureLable.textColor = .white
        temperatureLable.textAlignment = .center
    }

    private func setupDescriptionLable() {
        self.descriptionLable = UILabel()
        descriptionLable.font = .systemFont(ofSize: 20)
        descriptionLable.text = ""
        descriptionLable.textColor = .white
        descriptionLable.textAlignment = .center
    }

    private func setupBar(){
        self.bar = UINavigationBar()
        bar.backgroundColor = .systemBlue
        let  items = UINavigationItem()
        let button = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goCityVC))
        items.setRightBarButton(button, animated: true)
        bar.setItems([items], animated: true)
        bar.isHidden = !viewModel.updateLocation
    }

    private func setupCollectionView(){
        let layoutsss = UICollectionViewFlowLayout()
        layoutsss.scrollDirection = .vertical
        layoutsss.sectionHeadersPinToVisibleBounds = true
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutsss)
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 15.0
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionViewRegisterCell()
    }

    // MARK: - Register Cells

    private func collectionViewRegisterCell(){
        collectionView.register(DailyViewCell.self, forCellWithReuseIdentifier: DailyViewCell.identifare)
        collectionView.register(HourlyViewCell.self, forCellWithReuseIdentifier: HourlyViewCell.identifare)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
    }

    // MARK: - Add Subview

    private func viewAddSubview(){
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(nameCityLable)
        view.addSubview(temperatureLable)
        view.addSubview(descriptionLable)
        view.addSubview(collectionView)
        view.addSubview(bar)
    }

    // MARK: - Setups Constraint

    private func setupAnchors(){
        self.addButton.translatesAutoresizingMaskIntoConstraints = false
        self.cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.nameCityLable.translatesAutoresizingMaskIntoConstraints = false
        self.temperatureLable.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.bar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Bar
            self.bar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.bar.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.bar.rightAnchor.constraint(equalTo: view.rightAnchor),
            // cancelButton
            self.cancelButton.topAnchor.constraint(equalTo: view.topAnchor),
            self.cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.cancelButton.widthAnchor.constraint(equalTo: addButton.widthAnchor),
            // addButton
            self.addButton.topAnchor.constraint(equalTo: view.topAnchor),
            self.addButton.leftAnchor.constraint(equalTo: cancelButton.rightAnchor, constant: 75),
            self.addButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.addButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
            // nameCityLable
            self.nameCityLable.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 32),
            self.nameCityLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // temperatureLable
            self.temperatureLable.topAnchor.constraint(equalTo: nameCityLable.bottomAnchor, constant: 16),
            self.temperatureLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // descriptionLable
            self.descriptionLable.topAnchor.constraint(equalTo: temperatureLable.bottomAnchor, constant: 16),
            self.descriptionLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // collectionView
            self.collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            self.collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            self.collectionView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 32),
            self.collectionView.bottomAnchor.constraint(equalTo: bar.topAnchor, constant: -6)
            ])
    }

    private func setupAll(){
        setupNameCityLable()
        setupCancelButton()
        setupAddButton()
        setupDescriptionLable()
        setupTemperatureLable()
        setupBar()
        setupCollectionView()
        viewAddSubview()
        setupAnchors()
    }

    // MARK: - funcs

    @objc func goCityVC(){
        let cityVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "CityVC") as! CityVC
        cityVC.delegate = self
        navigationController?.pushViewController(cityVC, animated: true)
    }

    @objc func addDidTapped(){
        CoreDataService.shared.saveContext()
        dismiss(animated: true, completion: nil)
    }

    @objc func cancelDidTapped(){
        guard let result = viewModel.result else { return }
        CoreDataService.shared.managedObjectContext.delete(result)
        CoreDataService.shared.saveContext()
        dismiss(animated: true, completion: nil)
    }

    private func updateCurrent(){
        if let citys = viewModel.result?.city, let temp = viewModel.result?.current?.temp, let description = viewModel.result?.current?.attribute {
        self.nameCityLable.text = String(citys)
        self.temperatureLable.text = String(format: "%.1f°", temp)
        self.descriptionLable.text = description
        }
    }

    func bind(){
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.showAllert = self.showAlert(title:message:)
    }

    // MARK: - Lifecycle

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .viewBackColor
        setupAll()
        bind()
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard viewModel.result != nil else { return 0 }
        return SectionDefault.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let result = viewModel.result else { return 0 }
        switch section {
        case 0: return 1
        default: return result.daily?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let result = viewModel.result else { return UICollectionViewCell() }
        updateCurrent()
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(type: HourlyViewCell.self, indexPath: indexPath)
            guard let hourly = result.hourly?.toArray(CurrentCoreData.self) else { return UICollectionViewCell() }
            let sortHourly = hourly.sorted{ $0.date < $1.date }
            cell.updateAll(hourlyArray: sortHourly)
            return cell

        default:
            let cell = collectionView.dequeueReusableCell(type: DailyViewCell.self, indexPath: indexPath)
            guard let daily = result.daily?.toArray(DailyCoreData.self) else { return UICollectionViewCell() }
            let sortDaily = daily.sorted{ $0.da < $1.da }
            cell.updateAll(daily: sortDaily[indexPath.row], indexPath: indexPath)
            return cell
        }
    }


}


// MARK: - UICollectionViewDelegateFlowLayout

extension MainVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.section {
        case 0: return SectionDefault.size(forSection: .first)
        default: return SectionDefault.size(forSection: .secand)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SectionDefault.minimumLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return SectionDefault.edgeInsets
    }


    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as! SectionHeader
        switch indexPath.section {
        case 0:
            sectionHeader.configurateHeader(text: HeadersDefault.title(section: .first), headerImage: HeadersDefault.image(section: .first))
            return sectionHeader
        default:
            sectionHeader.configurateHeader(text: HeadersDefault.title(section: .secand), headerImage: HeadersDefault.image(section: .secand))
            return sectionHeader
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return HeadersDefault.size
    }

}


// MARK: - CityDelegate

extension MainVC: CityDelegate {

    func getCity(city: WeatherCoreData) {
        self.viewModel.result = city
    }
}

// MARK: - AlertHandler

extension MainVC: AlertHandler { }






