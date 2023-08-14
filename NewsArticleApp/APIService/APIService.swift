//
//  APIService.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ResponseCompletionBlock = (Bool, String?, JSON?) -> Void


class APIService: BaseService {
    
    static let shared = APIService()
    
    func getArticles(completion: @escaping ((ResponseCompletionBlock))) {
        AF.request(RouterService.getArticles)
            .responseJSON { response in
                let resultData = self.checkIfJsonDataExists(responseData: response)
                if let json = resultData.0 {
                    completion(true, "", json)
                } else if let messageData = resultData.1 {
                    completion(false, messageData, nil)
                } else{
                    completion(false, "", nil)
            }
        }
    }
    
}
