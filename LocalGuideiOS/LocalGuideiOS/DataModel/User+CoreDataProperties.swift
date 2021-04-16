//
//  User+CoreDataProperties.swift
//  LocalGuideiOS
//
//  Created by Zhancheng on 2021-04-15.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var userId: UUID?
    @NSManaged public var jwtToken: String?
    @NSManaged public var refreshToken: String?
    @NSManaged public var displayName: String?

}

extension User : Identifiable {

}
