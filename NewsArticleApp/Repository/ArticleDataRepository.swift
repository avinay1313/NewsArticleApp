//
//  ArticleDataRepository.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation
import CoreData

protocol ArticleRepository {
    func insert(articles: [Article])
    func getAll() -> [Article]?
}

struct ArticleDataRepository : ArticleRepository
{
    func insert(articles: [Article]) {

        for article in articles {
            let cdArticle = CDArticle(context: PersistentStorage.shared.context)
            cdArticle.title = article.title
            cdArticle.url = article.url
            cdArticle.articleDescription = article.description
            cdArticle.author = article.author
            cdArticle.publishedAt = article.publishedAt
            cdArticle.urlToImage = article.urlToImage
            cdArticle.content = article.content

            PersistentStorage.shared.saveContext()
        }
    }

    func getAll() -> [Article]? {

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDArticle.self)

        var articles : [Article] = []

        result?.forEach({ (cdArticle) in
            articles.append(cdArticle.convertToArticle())
        })

        return articles
    }
    
}
