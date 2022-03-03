//
//  WeatherViewModel.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 02.03.2022.
//

import Foundation

enum CloudyIcon: Int, CaseIterable {
    case sun
    case cloudy
    case rain
    case snow
    
    var icon: String {
        switch self {
        case .sun:
            return "sun.max"
        case .cloudy:
            return "cloud"
        case .rain:
            return "cloud.rain"
        case .snow:
            return "cloud.snow"
        }
    }
}

var days = ["Monday"]
