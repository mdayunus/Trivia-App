//
//  User+CoreDataProperties.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 11/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var gameNumber: Int64
    @NSManaged public var time: Date?
    @NSManaged public var name: String?
    @NSManaged public var question: [String]
    @NSManaged public var answers: [[String]]

}
