//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
    let name: String
    
    struct Weather: Codable {
        let temp: Double
        let humidity: Int
    }
}
