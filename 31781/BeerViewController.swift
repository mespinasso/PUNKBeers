//
//  BeerViewController.swift
//  31781
//
//  Created by Matheus Coelho Espinasso on 21/11/17.
//  Copyright © 2017 Matheus Coelho Espinasso. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    var beer: Beer!
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var lbIbu: UILabel!
    @IBOutlet weak var ivBeerImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let beer = beer {
            let resource = ImageResource(downloadURL: URL(string: beer.imageUrl)!, cacheKey: beer.imageUrl)
            
            lbName.text = beer.name
            lbTagline.text = beer.tagline
            lbDescription.text = beer.description
            lbAbv.text = "\(beer.abv)"
            ivBeerImage.kf.setImage(with: resource)
            
            if let ibu = beer.ibu {
                lbIbu.text = "\(ibu)"
            } else {
                lbIbu.text = "???"
            }
        }
    }
}
