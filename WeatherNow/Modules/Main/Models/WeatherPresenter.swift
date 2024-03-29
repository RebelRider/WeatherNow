//
//  WeatherPresenter.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 08.03.2022.
//

import UIKit


protocol WeatherPresentationLogic {
    func presentData(response: WeatherEnum.Model.Response.ResponseType)
}

class WeatherPresenter: WeatherPresentationLogic {
    
    weak var viewController: WeatherDisplayLogic?
    var router: WeatherRouter?
    
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "en_US") // identifier: "ru_RU"
        return dt
    }()
    
    //MARK: - button handler
    func onShowLocationInput() {
            router?.showLocationInput()
        }
    
    //MARK: - presentData
    func presentData(response: WeatherEnum.Model.Response.ResponseType) {
        
        switch response {
        case .presentWeather(let weather, let locality):
            var hourlyCells: [CurrentWeatherViewModel.Hourly] = []
            var dailyCells: [CurrentWeatherViewModel.Daily] = []
            
            // create data for hour cells
            weather.hourly.forEach { hourly in
                hourlyCells.append(CurrentWeatherViewModel.Hourly.init(dt: formattedDate(dateFormat: "HH",
                                                                                         date: hourly.dt),
                                                                                        temp: setSign(temp: Int(hourly.temp)),
                                                                                        description: hourly.weather.first!.description,
                                                                                        icon: hourly.weather.first!.icon))
            }
            hourlyCells.removeLast(24)
            hourlyCells[0].dt = "Now"
            
            // creating data for daily cells
            weather.daily.forEach { daily in
                dailyCells.append(CurrentWeatherViewModel.Daily.init(dt: formattedDate(dateFormat: "EEEE",
                                                                                       date: daily.dt),
                                                                                        minTemp: setSign(temp: Int(daily.temp.min)),
                                                                                        maxTemp: setSign(temp: Int(daily.temp.max)),
                                                                                        icon: daily.weather.first!.icon))
            }
            dailyCells[0].dt = "Today"
            
            // create data to minMaxLabel
            let maxMinTemp = "max.: \(dailyCells[0].maxTemp), min.: \(dailyCells[0].minTemp)"
            
            let currentWeather = headerViewModel(weatherModel: weather, hourlyCells: hourlyCells, maxMinTemp: maxMinTemp, dailyCells: dailyCells, locality: locality)
            
            // send display data to viewController
            viewController?.displayData(viewModel: .displayWeather(currentWeatherViewModel: currentWeather))
        }
    }
    
    // formatting the data for the specified format
    private func formattedDate(dateFormat: String, date: Double) -> String{
        dateFormatter.dateFormat = dateFormat
        let currentDate = Date(timeIntervalSince1970: date)
        let dateTitle = dateFormatter.string(from: currentDate).capitalizingFirstLetter()
        return dateTitle
    }
    
    // add the necessary symbols to the temperature
    private func setSign(temp: Int) -> String {
        var currentTemp: String = ""
        guard temp >= 1 else { currentTemp = " \(temp)º"; return currentTemp }
        currentTemp = " +\(temp)º"
        return currentTemp
    }
    
    private func directionOfDegrees(degree: Int) -> String {
        var direction = "N"
        
        if degree > 337 {
            direction = "N"
        } else if degree > 292 {
            direction = "NW"
        } else if degree > 247 {
            direction = "W"
        } else if degree > 202 {
            direction = "SW"
        } else if degree > 157 {
            direction = "S"
        } else if degree > 112 {
            direction = "SE"
        } else if degree > 67 {
            direction = "E"
        } else if degree > 22 {
            direction = "NE"
        } else {
            direction = "N"
        } //eenummm
            
        return direction
    }
    
    // convert data to CurrentWeatherViewModel
    private func headerViewModel(weatherModel: WeatherResponse, hourlyCells: [CurrentWeatherViewModel.Hourly], maxMinTemp: String, dailyCells: [CurrentWeatherViewModel.Daily], locality: String) -> CurrentWeatherViewModel{
        print("DEBUG: wing degrees: \(weatherModel.current.windDeg)")
        return CurrentWeatherViewModel.init(locality: locality,
                                            temp: setSign(temp: Int(weatherModel.current.temp)),
                                            weatherDescription: weatherModel.current.weather.first?.description ?? "null",
                                            icon: weatherModel.current.weather.first?.icon ?? "unknown",
                                            hourlyWeather: hourlyCells,
                                            maxMinTemp: maxMinTemp,
                                            dailyWeather: dailyCells,
                                            feelsLike: setSign(temp: Int(weatherModel.current.feelsLike)),
                                            windSpeed: String(Int(weatherModel.current.windSpeed)), // very bad converting...
                                            windDirection: directionOfDegrees(degree: weatherModel.current.windDeg),
                                            pressure: String(weatherModel.current.pressure),
                                            humidity: String(weatherModel.current.humidity))
    }
    
}
