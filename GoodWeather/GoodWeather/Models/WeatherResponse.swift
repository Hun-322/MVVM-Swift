//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [List]
    
    struct List: Codable {
        let main: Weather
    }
    
    struct Weather: Codable {
        let temp: Double
        let humidity: Int
    }
}
