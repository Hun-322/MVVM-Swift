//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        weatherViewModels = weatherViewModels.map{ vm in
            let weathermodel = vm
            weathermodel.temperature = (weathermodel.temperature - 32) * 5/9
            return weathermodel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map{ vm in
            let weathermodel = vm
            weathermodel.temperature = (weathermodel.temperature * 9/5) + 32
            return weathermodel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }

}
