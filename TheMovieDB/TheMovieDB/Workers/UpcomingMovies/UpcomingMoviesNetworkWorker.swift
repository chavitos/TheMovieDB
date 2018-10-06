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
                    NSLog("\(responseModel.results.count) movies, of \(responseModel.totalResults), returned to page \(responseModel.page) of \(responseModel.totalPages)")
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
