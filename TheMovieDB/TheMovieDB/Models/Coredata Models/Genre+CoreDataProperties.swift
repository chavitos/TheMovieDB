//
//  Genre+CoreDataProperties.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//
//

import Foundation
import CoreData


extension Genre {

    @nonobjc public class func genreFetchRequest() -> NSFetchRequest<Genre> {
        return NSFetchRequest<Genre>(entityName: "Genre")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}
