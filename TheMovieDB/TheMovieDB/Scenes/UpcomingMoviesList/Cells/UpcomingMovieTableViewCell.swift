//
//  UpcomingMovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import UIKit
import SDWebImage

class UpcomingMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var genreCollection: UICollectionView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    let genreCellIdentifier = "genreCell"
    var genreList:[String] = []
    
    override func prepareForReuse() {
        
        moviePosterImageView.image = nil
        movieTitleLabel.text = ""
        releaseDateLabel.text = ""
        genreList = []
    }
    
    func configCell(withUpcomingMovie upcomingMovie:DisplayUpcomingMovie) {
        
        movieTitleLabel.text = upcomingMovie.title
        releaseDateLabel.text = upcomingMovie.releaseDate
        
        genreList = upcomingMovie.genre
        genreCollection.reloadData()
    }
}

extension UpcomingMovieTableViewCell:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let genre = genreList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: genreCellIdentifier, for: indexPath) as! GenreCollectionViewCell
        
        cell.genreLabel.text = genre
        
        return cell
    }
}
