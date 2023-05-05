//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = "\(vm.tempature.formatAsDegree())°"
    }
}
