//
//  WeatherResponse.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 05.03.2022.
//

import Foundation

struct WeatherResponse: Decodable{
    let lat, lon: Double
    let current: Current
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}

struct Current: Decodable {
    let dt, temp: Double
    let weather: [WeatherInfo]
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let windSpeed: Double
    let windDeg: Int
}

struct WeatherInfo: Decodable {
    let description, icon: String
}

struct HourlyWeather: Decodable{
    let dt, temp: Double
    let weather: [HourlyWeatherInfo]
}

struct HourlyWeatherInfo: Decodable{
    let description, icon: String
}

struct DailyWeather: Decodable{
    let dt: Double
    let temp: DailyTemp
    let weather: [DailyWeatherInfo]
}

struct DailyTemp: Decodable{
    let min, max: Double
}

struct DailyWeatherInfo: Decodable{
    let icon: String
}
