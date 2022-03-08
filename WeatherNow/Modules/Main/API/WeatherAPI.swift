//
//  WeatherAPI.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 03.03.2022.
//

import Foundation
import Combine
import UIKit

struct WeatherAPI {
    static let shared = WeatherAPI() // ????
    
    static let apiKey = "da71454ede4b43e44b98f9b1dac9efc2"
    static let urlRu = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely&lang=ru&units=metric&appid=da71454ede4b43e44b98f9b1dac9efc2&"
    static let urlEn = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely&lang=en&units=metric&appid=da71454ede4b43e44b98f9b1dac9efc2&"
    
    static func getURLfor(lat: Double, lon: Double) -> String {
        return "onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(apiKey)&units=metric"
    }
}
