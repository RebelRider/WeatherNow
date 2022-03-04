//
//  LocationHandler.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    static let shared = LocationHandler()
    var locationManager: CLLocationManager!
    var location: CLLocation?    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager,
                                               didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
