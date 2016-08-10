//
//  MovieCell.swift
//  Favorite-Moviezz
//
//  Created by Preeti Patel on 09/08/16.
//  Copyright © 2016 Vandan Patel. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieURL: UIButton!
    @IBOutlet weak var movieImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        movieDesc.text = movie.movieDesc
        movieURL.setTitle(movie.url, forState: .Normal)
        movieImage.image = movie.getMovieImage()
        movieImage.layer.cornerRadius = 25.0
        movieImage.clipsToBounds = true
    }

}
