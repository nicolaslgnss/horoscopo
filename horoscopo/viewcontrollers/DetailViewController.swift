//
//  DetailViewController.swift
//  horoscopo
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!
    
    @IBOutlet weak var favoriteMenuItem: UIBarButtonItem!
    var isFavorite = false
    
    @IBOutlet weak var signImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        navigationItem.subtitle = horoscope.dates
        
        isFavorite = SesionManager().isFavorite(id: horoscope.id)
        setFavoriteIcon()
    }
    
    func setFavoriteIcon() {
        if isFavorite {
            favoriteMenuItem.image = UIImage(systemName: "heart.fill")
        } else {
            favoriteMenuItem.image = UIImage(systemName: "heart")
        }
    }
    @IBAction func favoriteMenuClicked(_ sender: Any) {
        let session = SesionManager()
        if (isFavorite) {
            session.setFavorite(id:"")
        } else {
            session.setFavorite(id: horoscope.id)
        }
        isFavorite = !isFavorite
        setFavoriteIcon()
    }
    
    @IBAction func shareMenuClicked(_ sender: Any) {
        // text to share
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text]
        let activityViewController = UIActivityViewController(activityItems: textToShare,applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that IPads won´t crash
        
        // exclude some activity types from the list ( optional)
        //activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook]
        
        // present the view controller
        self.present(activityViewController,animated: true, completion: nil)
    }
    
}
