//
//  UpcomingMoviesListViewControllerTests.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 06/10/2018.
//  Copyright (c) 2018 TiagoChaves. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheMovieDB
import XCTest

class UpcomingMoviesListViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: UpcomingMoviesListViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupUpcomingMoviesListViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupUpcomingMoviesListViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "UpcomingMoviesListViewController") as? UpcomingMoviesListViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class UpcomingMoviesListBusinessLogicSpy: UpcomingMoviesListBusinessLogic
    {
        var getGenresCalled = false
        var getUpcomingMoviesCalled = false
        var getFilteredUpcomingMoviewCalled = false
        var saveUpcomingMovieCalled = false
        
        var getUpcomingMoviesRequest:UpcomingMoviesList.MoviesList.Request!
        var getFilteredUpcomingMoviewRequest:UpcomingMoviesList.FilteredMovies.Request!
        var saveUpcomingMovieRequest:UpcomingMoviesList.MovieDetail.Request!
        
        func getGenres(request: UpcomingMoviesList.GenresList.Request) {
            getGenresCalled = true
        }
        
        func getUpcomingMovies(request: UpcomingMoviesList.MoviesList.Request) {
            getUpcomingMoviesCalled = true
            getUpcomingMoviesRequest = request
        }
        
        func getFilteredUpcomingMoview(request: UpcomingMoviesList.FilteredMovies.Request) {
            getFilteredUpcomingMoviewCalled = true
            getFilteredUpcomingMoviewRequest = request
        }
        
        func saveUpcomingMovie(request: UpcomingMoviesList.MovieDetail.Request) {
            saveUpcomingMovieCalled = true
            saveUpcomingMovieRequest = request
        }
    }
    
    class RouterSpy:UpcomingMoviesListRouter{
        
        var routerCalled = false
        
        override func routeToUpcomingMovieDetail(segue: UIStoryboardSegue?) {
            routerCalled = true
        }
    }
    
    class TableViewSpy: UITableView
    {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: Tests
    
    func testUpcomingMoviesListVCShouldAskInteractorToGetGenresAndUpcomingMoviesWhenViewIsLoaded()
    {
        // Given
        let spy = UpcomingMoviesListBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.getGenresCalled, "viewDidLoad() should ask the interactor to getGenres")
        XCTAssertTrue(spy.getUpcomingMoviesCalled, "viewDidLoad() should ask the interactor to getUpcomingMovies")
        XCTAssertEqual(spy.getUpcomingMoviesRequest.page, 1, "viewDidLoad() should ask the interactor to getUpcomingMovies of first page")
    }
    
    func testUpcomingMoviesListVCShouldAskInteractorToGetFilteredMoviesWhenSearchBarTextChange()
    {
        // Given
        let spy = UpcomingMoviesListBusinessLogicSpy()
        sut.interactor = spy
        let filterText = "The"
        // When
        loadView()
        sut.upcomingMoviesList = Seeds.DisplayUpcomingMovieList.movieList
        sut.searchBar(sut.searchBar,textDidChange: filterText)
        
        // Then
        XCTAssertTrue(spy.getFilteredUpcomingMoviewCalled, "searchBar textDidChange() should ask the interactor to getFilteredMovies")
        XCTAssertEqual(spy.getFilteredUpcomingMoviewRequest.text, filterText, "searchBar textDidChange() should ask the interactor to getFilteredUpcomingMovies with \(filterText) on title")
        XCTAssertEqual(spy.getFilteredUpcomingMoviewRequest.upcomingMovies, Seeds.DisplayUpcomingMovieList.movieList, "searchBar textDidChange() should ask the interactor to getFilteredUpcomingMovies in \(Seeds.DisplayUpcomingMovieList.movieList)")
    }
    
    func testUpcomingMoviesListVCShouldAskInteractorToSaveAMovieWhenACellIsTapped()
    {
        // Given
        let spy = UpcomingMoviesListBusinessLogicSpy()
        sut.interactor = spy
        sut.upcomingMoviesList = Seeds.DisplayUpcomingMovieList.movieList
        let indexPath = IndexPath(row: 0, section: 0)
        // When
        loadView()
        let expectedMovie = Seeds.DisplayUpcomingMovieList.movie1
        sut.tableView(sut.upcomingMoviesTable, didSelectRowAt:indexPath)
        
        // Then
        XCTAssertTrue(spy.saveUpcomingMovieCalled, "tableview didSelectRow atIndexPath() should ask the interactor to saveUpcomingMovie")
        XCTAssertEqual(spy.saveUpcomingMovieRequest.upcomingMovie,expectedMovie, "tableview didSelectRow atIndexPath() should ask the interactor to saveUpcomingMovie \(expectedMovie.title) and passed \(spy.saveUpcomingMovieRequest.upcomingMovie)")

    }
    
    func testUpcomingMoviesListVCShouldDisplayTheUpcomingMovieListAndRefreshNextPage(){
        
        // Given
        let tableViewSpy = TableViewSpy()
        sut.upcomingMoviesTable = tableViewSpy
        
        // When
        let expectedNextPage = Seeds.DisplayUpcomingMovieList.result.nextPage
        let viewModel = UpcomingMoviesList.MoviesList.ViewModel(upcomingMovies: Seeds.DisplayUpcomingMovieList.result, error: nil)
        sut.displayUpcomingMovies(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(tableViewSpy.reloadDataCalled, "displayUpcomingMovies(viewModel:) should refresh tableView data")
        XCTAssertEqual(sut.nextPage,expectedNextPage, "next page should be refreshed to \(expectedNextPage)")
    }
    
    func testUpcomingMoviesListVCShouldDisplayTheFilteredUpcomingMovieList(){
        
        // Given
        let tableViewSpy = TableViewSpy()
        sut.upcomingMoviesTable = tableViewSpy
        
        // When
        let viewModel = UpcomingMoviesList.FilteredMovies.ViewModel(filteredUpcomingMovies: Seeds.DisplayUpcomingMovieList.movieList)
        sut.displayFilteredUpcomingMovies(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(tableViewSpy.reloadDataCalled, "displayFilteredUpcomingMovies(viewModel:) should refresh tableView data")
    }
    
    func testUpcomingMoviesListVCShouldAskRouterToPresentMovieDetailVC(){
        
        // Given
        loadView()
        let routerSpy = RouterSpy()
        sut.router = routerSpy
        
        // When
        sut.displayUpcomingMovieDetail(viewModel: UpcomingMoviesList.MovieDetail.ViewModel())
        
        // Then
        XCTAssertTrue(routerSpy.routerCalled, "displayUpcomingMovieDetail(viewModel:) should ask router to present movie detail")
    }
    
    func testNumberOfLinesInTableView(){
        
        // Given
        loadView()
        let upcomingMoviesTable = sut.upcomingMoviesTable
        sut.upcomingMoviesList = Seeds.DisplayUpcomingMovieList.movieList
        sut.filtering = false
        
        // When
        let numberOfRows = sut.tableView(upcomingMoviesTable!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, sut.upcomingMoviesList.count, "The number of table view rows should be \(sut.upcomingMoviesList.count)")
    }
    
    func testNumberOfLinesInTableViewWhenTheListIsFiltered(){
        
        // Given
        loadView()
        let upcomingMoviesTable = sut.upcomingMoviesTable
        sut.filteredUpcomingMoviesList = [Seeds.DisplayUpcomingMovieList.movie1]
        sut.filtering = true
        
        // When
        let numberOfRows = sut.tableView(upcomingMoviesTable!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, sut.filteredUpcomingMoviesList.count, "The number of table view rows should be \(sut.upcomingMoviesList.count)")
    }
    
    func testShouldConfigureTableViewCellToDisplayMovie()
    {
        // Given
        loadView()
        let upcomingMoviesTable = sut.upcomingMoviesTable
        sut.upcomingMoviesList = Seeds.DisplayUpcomingMovieList.movieList

        // When
        let indexPath = IndexPath(row: 2, section: 0)
        let cell = sut.tableView(upcomingMoviesTable!, cellForRowAt: indexPath) as? UpcomingMovieTableViewCell
        let movie = Seeds.DisplayUpcomingMovieList.movie3
        
        // Then
        XCTAssertEqual(cell?.movieTitleLabel?.text, movie.title, "Title should be \(movie.title), not \(cell?.movieTitleLabel?.text ?? "")")
        XCTAssertEqual(cell?.releaseDateLabel?.text, movie.releaseDate, "Release date should be \(movie.releaseDate), not \(cell?.releaseDateLabel?.text ?? "")")
        XCTAssertEqual(cell?.genreList.count, movie.genre.count, "This movie should have \(movie.genre.count) genres, not \(cell?.genreList.count ?? 0)")
    }
    
    func testShouldConfigureTableViewCellToDisplayMovieWhenFiltered()
    {
        // Given
        loadView()
        let upcomingMoviesTable = sut.upcomingMoviesTable
        sut.filteredUpcomingMoviesList = Seeds.DisplayUpcomingMovieList.movieList
        sut.filtering = true
        
        // When
        let indexPath = IndexPath(row: 2, section: 0)
        let cell = sut.tableView(upcomingMoviesTable!, cellForRowAt: indexPath) as? UpcomingMovieTableViewCell
        let movie = Seeds.DisplayUpcomingMovieList.movie3
        
        // Then
        XCTAssertEqual(cell?.movieTitleLabel?.text, movie.title, "Title should be \(movie.title), not \(cell?.movieTitleLabel?.text ?? "")")
        XCTAssertEqual(cell?.releaseDateLabel?.text, movie.releaseDate, "Release date should be \(movie.releaseDate), not \(cell?.releaseDateLabel?.text ?? "")")
        XCTAssertEqual(cell?.genreList.count, movie.genre.count, "This movie should have \(movie.genre.count) genres, not \(cell?.genreList.count ?? 0)")
    }
}
