//
//  String+Extension.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/05.
//

import Foundation

extension String {
    // URL 문자열에 있는 호스트 구성 요소의 특수 문자를 인코딩하지 않도록하는 메서드
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
