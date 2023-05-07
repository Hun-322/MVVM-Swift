//
//  Constants.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

enum Urls {
    static func urlForWeatherByCity(city: String) -> URL {
        
        let userDefaults = UserDefaults.standard
        let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
        
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?&q=\(city.escaped())&appid=aba4abfbb1fe85614f76094fdc33ce68&\(unit)")!
    }
}
