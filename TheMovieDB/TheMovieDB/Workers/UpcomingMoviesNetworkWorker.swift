//
//  UpcomingMoviesNetworkWorker.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 03/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation

class UpcomingMoviesNetworkWorker:UpcomingMoviesListWorkerProtocol {
    
    func getUpcomingMovies(ofPage page: Int, completionHandler: @escaping (() throws -> UpcomingMovieResult) -> Void) {
        
        NetworkManager().getData(ofURL: MovieDBRequests.upcomingMovies(page)) { (data, error) in
            
            if error == nil, let data = data{
                do{
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(UpcomingMovieResult.self, from: data)
                    completionHandler{ return responseModel }
                }catch let error {
                    completionHandler{ throw error }
                }
            }else{
                completionHandler{ throw error! }
            }
        }
    }
}
