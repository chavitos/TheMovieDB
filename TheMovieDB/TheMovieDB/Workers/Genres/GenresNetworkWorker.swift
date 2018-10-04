//
//  GenresNetworkWorker.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation

class GenresNetworkWorker: GenresListWorkerProtocol {
    
    func getGenresList(completionHandler: @escaping (() throws -> [GenreData]) -> Void) {
        
        NetworkManager().getData(ofURL: MovieDBRequests.genres) { (data, error) in
            
            if error == nil, let data = data{
                do{
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(GenresResult.self, from: data)
                    completionHandler{ return responseModel.genres }
                }catch let error {
                    completionHandler{ throw error }
                }
            }else{
                completionHandler{ throw error! }
            }
        }
    }
}
