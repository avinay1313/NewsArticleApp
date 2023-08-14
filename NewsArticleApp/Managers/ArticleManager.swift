//
//  ArticleManager.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation

struct ArticleManager
{
    private let _articleDataRepository = ArticleDataRepository()

    func insert(articles: [Article]) {
        _articleDataRepository.insert(articles: articles)
    }

    func fetchArticles() -> [Article]? {
        return _articleDataRepository.getAll()
    }
}

