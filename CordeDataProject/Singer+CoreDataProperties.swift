//
//  Singer+CoreDataProperties.swift
//  CordeDataProject
//
//  Created by John Jeang on 7/1/21.
//
//

import Foundation
import CoreData


extension Singer {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}
