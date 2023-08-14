//
//  BaseService.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import Foundation
import SwiftyJSON
import Alamofire

class BaseService {
    
    func getData(From url: String) {
        
    }
    
    func checkIfJsonDataExists(responseData : AFDataResponse<Any>) -> (JSON?,String?)  {
        
        var responseJson: JSON?
        
        if let responseValue = responseData.value
        {
            responseJson = JSON(responseValue)
        }
        
        if responseData.response?.statusCode == 200
        {
            if let _ = responseJson, let responseJson = JSON(responseData.data!).dictionary {
                let swiftyJson = JSON(responseJson)
                var message = ""
                if let strMessage = responseJson["message"]?.string {
                    message = strMessage
                } else {
                    message = responseJson["rtnMessage"]?.string ?? ""
                }
                
                return (swiftyJson, message)
            } else  if let _ = responseJson, let responseJson = JSON(responseData.data!).array {
                let swiftyJson = JSON(responseJson)
                let message = ""
                return (swiftyJson, message)
            } else {
                let message = String(decoding: responseData.data!, as: UTF8.self)
                let responseJson = JSON(["message": message])
                return (responseJson, message)
            }
        }
        else
        {
            var message: String = ""
            if let responseJson = JSON(responseData.data).dictionary
            {
                message = responseJson["message"]?.string ?? ""
                if message.count == 0
                {
                    message = responseJson["error_description"]?.string ?? ""
                }
            }
            else
            {
                if let data = responseData.data {
                    message = String(decoding: data, as: UTF8.self)
                } else {
                    message = "Something went wrong. Please try again."
                }
            }
            return (nil, message)
        }
        
    }
    
}

