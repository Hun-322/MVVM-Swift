//
//  Order.swift
//  HotCoffee
//
//  Created by KSH on 2023/05/02.
//

import Foundation

enum CoffeeType: String, Codable{
    case cappuccino
    case latte
    case espressino
    case americano
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
