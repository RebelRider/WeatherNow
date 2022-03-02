import UIKit

struct WeatherModel: Codable {
    var id: Int
    let cityName: String
    let lat: Double
    let lon: Double
    
    let temp: String
    let feelsLike: String
    let pressure: String
    let windSpeed: Double
    let windDr: Int
    let humidity: Int
}
