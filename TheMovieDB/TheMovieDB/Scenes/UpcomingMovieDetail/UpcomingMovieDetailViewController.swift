//
//  UpcomingMovieDetailViewController.swift
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
import SDWebImage

protocol UpcomingMovieDetailDisplayLogic: class
{
    func displayMovieDetail(viewModel: UpcomingMovieDetail.MovieDetail.ViewModel)
}

class UpcomingMovieDetailViewController: UIViewController, UpcomingMovieDetailDisplayLogic
{
    var interactor: UpcomingMovieDetailBusinessLogic?
    var router: (NSObjectProtocol & UpcomingMovieDetailRoutingLogic & UpcomingMovieDetailDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = UpcomingMovieDetailInteractor()
        let presenter = UpcomingMovieDetailPresenter()
        let router = UpcomingMovieDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getMovieDetail()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
    }
    
    @objc func actionClose(_ tap: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Movie Detail
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var genresCollection: UICollectionView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overviewConstraint: NSLayoutConstraint!
    
    var genreList:[String] = []
    
    private func getMovieDetail()
    {
        let request = UpcomingMovieDetail.MovieDetail.Request(overviewFont: movieOverviewLabel.font, overviewWidth: movieOverviewLabel.frame.size.width)
        interactor?.getMovieDetail(request: request)
    }
    
    func displayMovieDetail(viewModel: UpcomingMovieDetail.MovieDetail.ViewModel) {
        
        let upcomingMovie = viewModel.upcomingMoviesDetail
        
        movieTitleLabel.text = upcomingMovie.title
        movieOverviewLabel.text = upcomingMovie.overview
        overviewConstraint.constant = viewModel.overviewHeightConstraint
        releaseDateLabel.text = upcomingMovie.releaseDate
        
        genresCollection.dataSource = self
        genreList = upcomingMovie.genre
        genresCollection.reloadData()
        
        let baseImageURLPath = "https://image.tmdb.org/t/p/w500"
        let imageURL = upcomingMovie.backdropPath.isEmpty ? baseImageURLPath + upcomingMovie.posterPath : baseImageURLPath + upcomingMovie.backdropPath
        self.movieImageView.sd_setImage(with: URL(string: imageURL),
                                        placeholderImage: UIImage(named: "picture_placeholder"))
        
        self.view.layoutIfNeeded()
    }
}

extension UpcomingMovieDetailViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let genre = genreList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"genreCell", for: indexPath) as! GenreCollectionViewCell
        
        cell.genreLabel.text = genre
        
        return cell
    }
}
