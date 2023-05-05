//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Urls.urlForWeatherByCity(city: city)
        
        let weatherResoruce = Resoucre<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            return weatherResponse
        }
        
        WebService().laod(resource: weatherResoruce) { result in
            if let weatherResoruce = result {
                let vm = WeatherViewModel(weather: weatherResoruce)
                completion(vm)
            }
        }
    }
}
