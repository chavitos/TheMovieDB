//
//  UpcomingMovie.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation

struct UpcomingMovieResult:Codable {
    
    let page:Int
    let totalPages:Int
    let totalResults:Int
    let results:[UpcomingMovie]
    
    enum CodingKeys: String, CodingKey {
        case page           = "page"
        case totalPages     = "total_pages"
        case totalResults   = "total_results"
        case results        = "results"
    }
    
}

struct UpcomingMovie:Codable {
    
    let id:Int
    let posterPath:String?
    let backdropPath:String?
    let overview:String
    let releaseDate:String
    let genre:[Int]
    let title:String
    
    enum CodingKeys: String, CodingKey {
        case id             = "id"
        case posterPath     = "poster_path"
        case backdropPath   = "backdrop_path"
        case overview       = "overview"
        case releaseDate    = "release_date"
        case genre          = "genre_ids"
        case title          = "title"
    }
}
