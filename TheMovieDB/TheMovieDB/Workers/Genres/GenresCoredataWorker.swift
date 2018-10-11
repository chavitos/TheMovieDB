//
//  GenresCoredataWorker.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation
import CoreData

class GenresCoredataWorker: GenresCoreDataListWorkerProtocol {
    
    func getGenresList(withIds ids: [Int], completionHandler: @escaping (() throws -> [GenreData]) -> Void) {
        
        let result = Genre.getGenreData(withIds: ids)
        
        if let genresData = result.0 {
            completionHandler{ return genresData }
        }else if let error = result.1 {
            completionHandler { throw error }
        }
    }
}
