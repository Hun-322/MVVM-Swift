//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import UIKit

protocol AddWeatehrDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatehrDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true)
    }
}
