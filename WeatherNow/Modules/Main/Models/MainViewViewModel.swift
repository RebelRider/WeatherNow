import UIKit
import CoreLocation

final class CityViewViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "New York" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    private lazy var dayFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    private lazy var timeFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTempFore(temp: weather.current.temp)
    }
    
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "0.1f%", weather.current.windspeed)
    }
    
    var humidity: String {
        return String(format: "%d", weather.current.humidity)
    }
    
    var rainChance: String {
        return String(format: "%0.0f", weather.current.dewpoint)
    }
    
    func getDayFor(timestmp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestmp)))
    }
    
    func getTimeFor(timestmp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestmp)))
    }
    
    func getTempFore(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coordinates: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coordinates:CLLocationCoordinate2D?) {
        if let coord = coordinates {
            let urlString = WeatherAPI.getURLfor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = WeatherAPI.getURLfor(lat: 40.7128, lon: 74.0060)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err.localizedDescription)//????
            }
            
        }
    }
    
       
    func getWeatherIcon(icon: String) -> UIImage? { // get icons!
        switch icon {
        case "01d":
            return UIImage(systemName: "sun.max.fill")
        case "01n":
            return UIImage(systemName: "moon.fill")
        default:
            return UIImage(systemName: "sun")
        }
    }
}
