//
//  UpcomingMovieDetailPresenter.swift
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

protocol UpcomingMovieDetailPresentationLogic
{
    func presentMovieDetail(response: UpcomingMovieDetail.MovieDetail.Response)
}

class UpcomingMovieDetailPresenter: UpcomingMovieDetailPresentationLogic
{
    weak var viewController: UpcomingMovieDetailDisplayLogic?
    
    // MARK: - Present Movie Detail
    
    func presentMovieDetail(response: UpcomingMovieDetail.MovieDetail.Response) {
        
        let overviewHeightConstraint = response.upcomingMoviesDetail.overview.height(withConstrainedWidth: response.overviewWidth,
                                                                                     font: response.overviewFont)
        
        let viewModel = UpcomingMovieDetail.MovieDetail.ViewModel(upcomingMoviesDetail: response.upcomingMoviesDetail,
                                                                  overviewHeightConstraint: overviewHeightConstraint)
        viewController?.displayMovieDetail(viewModel: viewModel)
    }
}
