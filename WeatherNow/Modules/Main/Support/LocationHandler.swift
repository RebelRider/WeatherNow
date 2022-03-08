//
//  LocationHandler.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit
import CoreLocation

protocol DataUpdater {
    func makeRequest(request: WeatherEnum.Model.Request.RequestType)
}

class WeatherInteractor: NSObject, DataUpdater, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var presenter: WeatherPresentationLogic?
    var networkManager = NetworkManager()
    
    //MARK: - makeRequest
    func makeRequest(request: WeatherEnum.Model.Request.RequestType) {
       
        switch request {
        case .getWeather:
            getLocation()
        }
    }
    
    private func getLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    //MARK: - locationManager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //get coordinates
        guard let location = locations.last else { return }
        self.locationManager.stopUpdatingLocation()
        let coordinates = "lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)"
        guard let currentLocation = locationManager.location else { return }
        
        //get location name
        geocoder.reverseGeocodeLocation(currentLocation, preferredLocale: Locale.init(identifier: "en_US")) { placemarks, error in //identifier: "ru_RU"
            let locality = placemarks?[0].locality ?? (placemarks?[0].name ?? "ERROR!")
            
                //getWeather
                self.networkManager.getWeather(coordinates: coordinates) { weatherResponse in
                    guard let weatherResponse = weatherResponse else { return }
                    self.presenter?.presentData(response: .presentWeather(weather: weatherResponse, locality: locality))
                }
        }
    }
}

