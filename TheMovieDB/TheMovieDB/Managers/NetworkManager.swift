//
//  NetworkManager.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 03/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation
import Alamofire

public enum MovieDBRequests: URLRequestConvertible {
    
    static let baseURLPath = "https://api.themoviedb.org/3"
    static let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    
    case upcomingMovies(Int)
    case movieDetail(String)
    case genres
    
    var method: HTTPMethod {
        switch self {
        case .upcomingMovies, .movieDetail, .genres:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .upcomingMovies:
            return "/movie/upcoming"
        case .movieDetail(let movieId):
            return movieId
        case .genres:
            return "/genre/movie/list"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .upcomingMovies(let page):
            return ["api_key": MovieDBRequests.apiKey,"language":"en-US","page":page]
        case .movieDetail:
            return ["api_key": MovieDBRequests.apiKey]
        case .genres:
            return ["api_key": MovieDBRequests.apiKey,"language":"en-US"]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try MovieDBRequests.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

class NetworkManager {
    
    func getData(ofURL url:URLRequestConvertible, callback:@escaping (Data?,Error?)->Void) {
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                let data = response.data
                callback(data, nil)
            case .failure(let error):
                callback(nil, error)
            }
        }
    }
}
