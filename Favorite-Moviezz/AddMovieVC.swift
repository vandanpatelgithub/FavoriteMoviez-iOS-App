//
//  AddMovieVC.swift
//  Favorite-Moviezz
//
//  Created by Preeti Patel on 09/08/16.
//  Copyright © 2016 Vandan Patel. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieURL: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var movieImage: UIImageView!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImage.layer.cornerRadius = 25.0
        movieImage.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 30, height: 30))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "image2")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }
    
    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)
            
            let movie = Movie(entity: entity!, insertIntoManagedObjectContext: context)
            
            movie.title = movieTitle.text
            movie.movieDesc = movieDesc.text
            movie.url = movieURL.text
            movie.plot = moviePlot.text
            movie.setMovieImage(movieImage.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Couldn't save the movie!")
            }
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
