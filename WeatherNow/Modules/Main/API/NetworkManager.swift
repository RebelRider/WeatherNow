//
//  NetworkManager.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 04.03.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}

final class NetworkManager<T: Codable> { // we will use for any type of API calls, that conforms to Codable:)
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard err == nil else {
                print(String(describing: err))
                completion(.failure(.error(err: err!.localizedDescription)))
                return
            }
            guard let httpResp = resp as? HTTPURLResponse, httpResp.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
            
            
        }.resume()
    }
}
