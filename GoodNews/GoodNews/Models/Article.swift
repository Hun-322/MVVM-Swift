//
//  Article.swift
//  GoodNews
//
//  Created by KSH on 2023/05/01.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

