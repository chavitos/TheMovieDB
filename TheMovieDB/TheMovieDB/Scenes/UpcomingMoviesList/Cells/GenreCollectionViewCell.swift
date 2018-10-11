//
//  GenreCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    
    override func prepareForReuse() {
        genreLabel.text = ""
    }
}
