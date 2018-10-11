//
//  Genre+CoreDataClass.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Genre)
public class Genre: NSManagedObject {
    
    static func add(genres:[GenreData]) {
        
        let context = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        NSLog("Saving Genres in coredata...")
        for genre in genres{
    
            if let genreObj = NSEntityDescription.insertNewObject(forEntityName: "Genre", into: context) as? Genre {
                
                genreObj.id = Int16(genre.id)
                genreObj.name = genre.name
            }
        }
        
        CoreDataManager.sharedInstance.saveContext()
        NSLog("Genres saved!")
    }
    
    static func getGenreData(withIds ids:[Int]) -> ([GenreData]?,Error?) {
        
        let context:NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        let fetch = Genre.genreFetchRequest()
        fetch.predicate = NSPredicate(format: "id IN %@", ids)
        
        NSLog("Getting genres with \(fetch.predicate!)")
        
        do{
            let result:[Genre] = try context.fetch(fetch)
            let genresData = GenreData.getGenreData(ofGenres: result)
            NSLog("Genres with \(fetch.predicate!) fetched with success")
            return (genresData,nil)
        }catch let error{
            NSLog("Failed trying to get genres with \(fetch.predicate!)")
            return (nil,error)
        }
    }
}
