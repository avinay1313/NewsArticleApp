//
//  RouterService.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation
import Alamofire

public enum RouterService: URLRequestConvertible {
  
    case getArticles

    var method: HTTPMethod {
        switch self {
        case .getArticles:
            return .get
        
        }
        
    }
    
    var parameters: Parameters? {
        switch self {
            
        case .getArticles:
            return nil
            
        
        }
    }
    
    var query: String {
        switch self {
        case .getArticles:
            return ""
            
        
        }
    }
    
    var url : String {
        var endPoint = ""
        switch self {
        case .getArticles:
            endPoint = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d834f08c4a464d58a0bce29860c20179"
        
        }
        return endPoint
    }
    
    var data: Data? {
        
        switch self {
            
        case .getArticles:
            return nil
        }
        
    }
    
    func getRequest() throws -> URLRequest {
        
        if method == .get{
            let url = try self.url.asURL()
            return URLRequest(url: url)
        }else{
            let url = try self.url.asURL()
            return URLRequest(url: url)
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var request = try getRequest()
        request.httpMethod = method.rawValue
        
        if let data = self.data {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        } else {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let params = parameters {
                return try URLEncoding.default.encode(request, with: params)
            }else{
                return try URLEncoding.default.encode(request, with: nil)
            }
        }
        
        return request
    }
        
    private func bearerAuthenticationHeader(with token: String) -> String {
        return "bearer \(token)"
    }
}
