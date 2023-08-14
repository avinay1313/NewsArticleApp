//
//  ArticlesModel.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation

// MARK: - Welcome
struct ArticlesModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}

