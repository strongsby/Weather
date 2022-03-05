

import UIKit
import CoreLocation


final class CityVC: UIViewController {

    // MARK: - Properties
    
    private var searchBar: UISearchBar!
    private var tableView: UITableView!
    private var arrayOfBarButtons = [UIBarButtonItem]()
    var delegate: CityDelegate!                           
    var viewModel: CityViewModelProtocol = CityViewModel()

    // MARK: - Setups
    
    private func setupNavigationBarItem(){
        let onButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(onButtonDidTapped))
        let ofButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ofButtonDidTapped))
        arrayOfBarButtons = [onButton, ofButton]
        navigationItem.setRightBarButton(onButton, animated: true)
    }

    private func setupTableView(){
        self.tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifare)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupSearchBar(){
        self.searchBar = UISearchBar()
        searchBar.barTintColor = .clear
        searchBar.searchTextField.textColor = .white
        searchBar.delegate = self
        searchBar.placeholder = "Search for a city or airport"
    }

    private func viewAddSubView(){
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }

    private func setupAnchors(){
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // searchBar
            self.searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 75.0),
            self.searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            self.searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            // tableView
            self.tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 6.0),
            self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16.0)
        ])
    }

    private func setupAll(){
        setupNavigationBarItem()
        setupTableView()
        setupSearchBar()
        viewAddSubView()
        setupAnchors()
    }

    private func bind() {
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.showAllert = self.showAlert(title:message:)
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupAll()
        bind()
    }
    
    // MARK: - funcs

    @objc func onButtonDidTapped(){
        navigationItem.setRightBarButton(arrayOfBarButtons[1], animated: false)
        tableView.setEditing(true, animated: true)
    }

    @objc func ofButtonDidTapped(){
        navigationItem.setRightBarButton(arrayOfBarButtons[0], animated: false)
        tableView.setEditing(false, animated: true)
    }

    private func containsСity(city: String) -> Bool {
        var bool = true
        viewModel.result.forEach{ if city == $0.city { bool = false } }
        return bool
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension CityVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.result.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifare, for: indexPath) as! Cell
        cell.updateAll(weatherResponce: viewModel.result[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.getCity(city: viewModel.result[indexPath.row])
        navigationController?.popViewController(animated: true)
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove city"
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataService.shared.managedObjectContext.delete(viewModel.result[indexPath.row])
        viewModel.result.remove(at: indexPath.row)
        CoreDataService.shared.saveContext()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == 0 ? false : true
    }
}


// MARK: - UISearchBarDelegate, UISearchDisplayDelegate

extension CityVC: UISearchBarDelegate, UISearchDisplayDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let city = searchBar.text else { return }
        CLGeocoder().geocodeAddressString(city) { [weak self] (placeMarc, error) in
            guard let searchCity = placeMarc?.first?.locality else {
                self?.showAlert(title: "Sorry", message: "City error")
                return
            }
            guard self != nil , self!.containsСity(city: searchCity) else {
                self?.showAlert(title: "Sorry", message: "You have \(searchCity) in your list")
                return
            }
            let mainVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MainVC") as! MainVC
            mainVC.viewModel = MainViewModel.init(updateLocation: false)
            mainVC.viewModel.city = searchCity
            self?.searchBar.text = nil
            self?.searchBar.resignFirstResponder()
            self?.navigationController?.present(mainVC, animated: true, completion: nil)
        }
    }
}


// MARK: - AlertHandler

extension CityVC: AlertHandler { }







