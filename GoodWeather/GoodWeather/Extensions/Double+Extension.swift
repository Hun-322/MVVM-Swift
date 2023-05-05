//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f", self)
    }
}
