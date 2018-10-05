//
//  UpcomingMoviesListRouter.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 03/10/18.
//  Copyright (c) 2018 TiagoChaves. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol UpcomingMoviesListRoutingLogic
{
    func routeToUpcomingMovieDetail(segue: UIStoryboardSegue?)
}

protocol UpcomingMoviesListDataPassing
{
    var dataStore: UpcomingMoviesListDataStore? { get }
}

class UpcomingMoviesListRouter: NSObject, UpcomingMoviesListRoutingLogic, UpcomingMoviesListDataPassing
{
    weak var viewController: UpcomingMoviesListViewController?
    var dataStore: UpcomingMoviesListDataStore?
    
    // MARK: Routing
 
    func routeToUpcomingMovieDetail(segue: UIStoryboardSegue?) {
        
        if let segue = segue {
            let destinationVC = segue.destination as! UpcomingMovieDetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToUpcomingMovieDetailt(source: dataStore!, destination: &destinationDS)
        }
    }
    
    // MARK: Navigation
    
    func navigateToUpcomingMovieDetail(source: UpcomingMoviesListViewController, destination: UpcomingMovieDetailViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToUpcomingMovieDetailt(source: UpcomingMoviesListDataStore, destination: inout UpcomingMovieDetailDataStore)
    {
        destination.upcomingMovie = source.upcomingMovie
    }
}
