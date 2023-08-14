//
//  ArticlesListViewModel.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation

typealias CompletionBlock = (Bool)

class ArticlesListViewModel {
    
    var articlesModel: ArticlesModel?
    
    var arrArticles: [Article]?
    
    
    func getArticles(completion: @escaping ((CompletionBlock) -> Void)) {
        APIService.shared.getArticles(completion: { isSuccess, message, jsonObj in
            if isSuccess {
                do {
                    if let json = jsonObj {
                        let decoder = JSONDecoder()
                        self.articlesModel = try decoder.decode(ArticlesModel.self, from: json.rawData())
                        self.arrArticles = self.articlesModel?.articles
                        completion(true)
                    }
                } catch (let exception) {
                    print(exception)
                    completion(false)
                }
            }
        })
    }
    
}
