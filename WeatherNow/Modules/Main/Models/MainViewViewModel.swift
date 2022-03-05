import UIKit
import CoreLocation

final class CityViewViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "New York" {
        didSet {
            //get location
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
        //
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
}
