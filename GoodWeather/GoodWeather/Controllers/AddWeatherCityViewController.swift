//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "")!
            
            let weatherResource = Resoucre<Any>(url: weatherURL) { data in
                return data
            }
            
            WebService().laod(resource: weatherResource) { reuslt in
                
            }
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true)
    }
}
