//
//  NetworkManager.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 04.03.2022.
//

import Foundation

protocol NetworkManagerProtocol{
    func getWeather(coordinates: String, completion: @escaping (WeatherResponse?) -> Void)
}

struct NetworkManager: NetworkManagerProtocol{
    
    func getWeather(coordinates: String, completion: @escaping (WeatherResponse?) -> Void) {
        
        let fullUrl = "\(WeatherAPI.urlEn)\(coordinates)"
        
        guard let url = URL(string: fullUrl) else { print("Error - wrong URL....")
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in // completetion handler, if no error
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decoded = self.decodeJSON(type: WeatherResponse.self, from: data)
            
            let dataStringForPrint = String(data: data!, encoding: .utf8) // for Debug
            print("\n \n DEBUG: data is: \(String(describing: dataStringForPrint))") // for Debug
            
            completion(decoded)
        }
        .resume() // start the task
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T?{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { print("DEBUG: Error decoding data...")
            return nil }
        return response // return decoded Data, so struct
    }
}
