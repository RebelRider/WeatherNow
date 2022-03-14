//
//  WeatherRouter.swift
//  Weather
//
//  Created by Kirill Smirnov on 14.03.2022.
//

import UIKit

class WeatherRouter {
    weak var viewController: UIViewController?
    
    func showLocationInput() {
        let locationInputViewController = LocationInputViewController()        
        viewController?.navigationController?.pushViewController(locationInputViewController, animated: true)
    }
}
