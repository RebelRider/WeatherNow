//
//  WeatherResponse.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 05.03.2022.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    static func emptu() -> WeatherResponse {
        return WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 23),
            daily: [DailyWeather](repeating: DailyWeather(), count: 7)
        )
    }
}
