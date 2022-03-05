//
//  WeatherDaily.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 05.03.2022.
//

import Foundation

struct DailyWeather: Codable { //, Identifiable ??
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}
