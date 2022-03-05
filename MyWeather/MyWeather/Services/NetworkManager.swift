//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Сергей Рудинский on 13.02.22.
//

import Foundation
import CoreLocation

final class NetworkManager {
    
    var api = API()
    
    func fetchWeatherWithLocation(lat: Double, lon: Double, complition: @escaping (WeatherResponse?, NetworkError?) -> Void) {
        guard let url = URL(string: api.getURLStringFor(lat: lat, lon: lon)) else {
            DispatchQueue.main.async {
                complition(nil, .URLError)
            }
            return
            
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                complition(nil, .error(err: error!.localizedDescription))
                }
                return
            }
            
            guard let HTTPResponse = response as? HTTPURLResponse, HTTPResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                complition(nil, .invalidResponse)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                complition(nil, .invalidData)
                }
                return
            }
            
            do {
                var datasss = try JSONDecoder().decode(WeatherResponse.self, from: data)
                CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: lat, longitude: lon)) { placemark, error in
                    if let city = placemark?[0].locality {
                        datasss.city = city
                        DispatchQueue.main.async {
                            complition(datasss, nil)
                        }
                    }
                }
            } catch let err {
                DispatchQueue.main.async {
                complition(nil, .decodingError(err: err.localizedDescription))
                }
            }
        }.resume()
    }
    
    func fetchWeatherWithCity(sity: String, complition: @escaping (WeatherResponse?, NetworkError?) -> Void) {
        CLGeocoder().geocodeAddressString(sity) { (placeMarc, error) in
            if let places = placeMarc, let place = places.first,
               let lat = place.location?.coordinate.latitude,
               let lon = place.location?.coordinate.longitude {
                self.fetchWeatherWithLocation(lat: lat, lon: lon) { weather, errors in
                    complition(weather, errors)
                    }
            } else {
                complition(nil, .cityError)
            }
        }
    }
    
    enum NetworkError: Error {
        case cityError
        case URLError
        case invalidResponse
        case invalidData
        case error( err: String )
        case decodingError(err: String)
    }
}

