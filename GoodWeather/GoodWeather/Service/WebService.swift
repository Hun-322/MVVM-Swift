//
//  WebService.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//

import Foundation

struct Resoucre<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    func laod<T>(resource: Resoucre<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
                
            }else {
                completion(nil)
            }
        }.resume()
    }
}
