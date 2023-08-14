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

    @NSManaged public var url: String?
    @NSManaged public var title: String?
    
    func convertToArticle() -> Article
    {
        return Article(title: self.title, url: self.url)
    }

}
