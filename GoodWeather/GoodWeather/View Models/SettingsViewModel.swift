//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefualts = UserDefaults.standard
            var unitValue = ""
            if let value = userDefualts.value(forKey: "unit") as? String {
                unitValue = value
            }
            print(unitValue)
            print(Unit(rawValue: unitValue))
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
