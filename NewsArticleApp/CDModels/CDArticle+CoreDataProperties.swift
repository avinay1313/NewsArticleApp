//
//  CDArticle+CoreDataProperties.swift
//  
//
//  Created by Admin on 14/08/23.
//
//

import Foundation
import CoreData


extension CDArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArticle> {
        return NSFetchRequest<CDArticle>(entityName: "CDArticle")
    }

    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var author: String?
    @NSManaged public var articleDescription: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var content: String?
    
    func convertToArticle() -> Article
    {
        return Article(author: self.author, title: self.title, description:self.articleDescription,  url: self.url, urlToImage: self.urlToImage, publishedAt: self.publishedAt, content: self.content)
    }

}
