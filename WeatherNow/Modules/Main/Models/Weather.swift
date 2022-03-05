import Foundation

class Weather: Codable {
    var dt: Int
    var temp: Double
    var feelslike: Double
    var pressure: Int
    var humidity: Int
    var dewpoint: Double
    var clouds: Int
    var windspeed: Double
    var winddeg: Int
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case feelslike
        case pressure
        case humidity
        case dewpoint
        case clouds
        case windspeed
        case winddeg
        case weather
    }
    
    init() {
        dt = 0
        temp = 0.0
        feelslike = 0.0
        pressure = 0
        humidity = 0
        dewpoint = 0.0
        clouds = 0
        windspeed = 0.0
        winddeg = 0
        weather = []
    }
}
