//
//  Movie.swift
//  Favorite-Moviezz
//
//  Created by Preeti Patel on 09/08/16.
//  Copyright © 2016 Vandan Patel. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
}
