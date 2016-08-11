//
//  DetailedVC.swift
//  Favorite-Moviezz
//
//  Created by Preeti Patel on 09/08/16.
//  Copyright © 2016 Vandan Patel. All rights reserved.
//

import UIKit

class DetailedVC: UIViewController {
    
    
    @IBOutlet weak var bigMovieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var movieURL: UIButton!
    @IBOutlet weak var moviePlot: UITextView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let moviez = movie {
            self.navigationItem.title = moviez.title
            bigMovieImage.image = moviez.getMovieImage()
            bigMovieImage.layer.cornerRadius = 15.0
            bigMovieImage.clipsToBounds = true
            movieTitle.text = moviez.title
            descriptionText.text = moviez.movieDesc
            movieURL.setTitle(moviez.url, forState: .Normal)
            moviePlot.text = moviez.plot
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "URLVC" {
            if let urlVC = segue.destinationViewController as? URLVC {
                if let moviez = movie {
                    if let url = moviez.url {
                        urlVC.urlString = url
                    }
                }
            }
        }
    }
}
