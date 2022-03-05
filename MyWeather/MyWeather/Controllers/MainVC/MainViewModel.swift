

import Foundation
import CoreLocation
import CoreData


// MARK: - MainViewModelProtocol

protocol MainViewModelProtocol: NSObject {
    var city: String { get set }
    var result: WeatherCoreData? { get set }
    var updateLocation: Bool { get set }
    var showAllert: ((_: String , _: String) -> Void)? { get set }
    var reloadData: (() -> Void)? { get set }
}


final class MainViewModel: NSObject, MainViewModelProtocol {
    
    // MARK: - Properties
    
    var showAllert: ((_: String , _: String) -> Void)?
    var reloadData: (() -> Void)?
    var updateLocation = true
    private var locationManager = CLLocationManager()
    private var networcManager = NetworkManager()
    private var fetchedResultsController: NSFetchedResultsController<WeatherCoreData>!
    
    var result: WeatherCoreData? {
        didSet { reloadData?() }
        }
    
    var city: String = "" {
        didSet {
            self.updateLocation = false
            networcManager.fetchWeatherWithCity(sity: city) { Weather, error in
                if let error = error {
                    self.showAllert?("Sorry", "\(error)")
                } else if let Weather = Weather {
                    Weather.createCoreDataWeather(active: false) { coreWeather in
                        self.result = coreWeather
                    }
                    CoreDataService.shared.saveContext()
                }
            }
        }
    }
    
    // MARK: - Setups
    
    fileprivate func setupFetchController() {
        let request = NSFetchRequest<WeatherCoreData>(entityName: "WeatherCoreData")
        let sortedDescription = NSSortDescriptor(key: "active", ascending: true)
        let predicate = NSPredicate(format: "active == %@", NSNumber(value: true))
        request.predicate = predicate
        request.sortDescriptors = [sortedDescription]
        fetchedResultsController = NSFetchedResultsController<WeatherCoreData>(fetchRequest: request, managedObjectContext: CoreDataService.shared.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        if self.updateLocation {
            loadWeatherCoreData()
        }
    }
    
    fileprivate func setupLocationManager() {
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() && self.updateLocation  {
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.pausesLocationUpdatesAutomatically = true
            if self.updateLocation {
                locationManager.startUpdatingLocation()
            }
        }
    }
    
    //MARK: - Backup
    
    private func loadWeatherCoreData(){
        try? fetchedResultsController.performFetch()
        if let result = fetchedResultsController.fetchedObjects {
            guard let first = result.first else { return }
            self.result = first
        }
    }
    
    // MARK: - Override Init
    
    override init() {
        super.init()
        setupFetchController()
        setupLocationManager()
    }
    
    init (updateLocation: Bool) {
        super.init()
        self.updateLocation = false
    }
}


//MARK: - CLLocationManagerDelegate

extension MainViewModel: CLLocationManagerDelegate  {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            self.networcManager.fetchWeatherWithLocation(lat: lastLocation.coordinate.latitude, lon: lastLocation.coordinate.longitude) { response, error in
                if let response = response {
                    if let result = self.result {
                        CoreDataService.shared.managedObjectContext.delete(result)
                        response.createCoreDataWeather(active: true, complition: nil)
                        CoreDataService.shared.saveContext()
                    } else {
                        response.createCoreDataWeather(active: true, complition: nil)
                        CoreDataService.shared.saveContext()
                    }
                    self.locationManager.stopUpdatingLocation()
                } else if let error = error {
                    self.showAllert?("Sorry", "\(error)")
                }
            }
        }
    }
}


//MARK: - NSFetchedResultsControllerDelegate

extension MainViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        loadWeatherCoreData()
    }
}





//Test
