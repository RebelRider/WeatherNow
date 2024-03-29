import UIKit

enum WeatherEnum {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getWeather
            }
        }
        struct Response {
            enum ResponseType {
                case presentWeather(weather: WeatherResponse, locality: String)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayWeather(currentWeatherViewModel: CurrentWeatherViewModel)
            }
        }
    }
    
}

struct CurrentWeatherViewModel {
    let locality: String
    let temp: String
    let weatherDescription: String
    let icon: String
    let hourlyWeather: [Hourly]
    let maxMinTemp: String
    let dailyWeather: [Daily]
    let feelsLike: String
    let windSpeed: String
    let windDirection: String
    let pressure: String
    let humidity: String
    
    struct Hourly{
        var dt: String
        let temp: String
        let description: String
        let icon: String
    }
    
    struct Daily{
        var dt: String
        let minTemp: String
        let maxTemp: String
        let icon: String
    }
}
