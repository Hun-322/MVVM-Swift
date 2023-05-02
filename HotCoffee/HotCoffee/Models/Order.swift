//
//  Order.swift
//  HotCoffee
//
//  Created by KSH on 2023/05/02.
//

import Foundation

// CaseIterable == 모든 케이스를 컬렉션 형태로 제공하는 프로토콜
// allCases라는 속성을 사용하여 열거형의 모든 케이스를 배열로 가져올 수 있다.
enum CoffeeType: String, Codable, CaseIterable{
    case cappuccino
    case latte
    case espressino
    case americano
}

enum CoffeeSize: String, Codable, CaseIterable {
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

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL이 이상해요!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL이 이상해요!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("인코딩 에러입니다!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}


extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
