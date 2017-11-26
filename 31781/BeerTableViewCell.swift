//
//  BeerTableViewCell.swift
//  31781
//
//  Created by Matheus Coelho Espinasso on 25/11/17.
//  Copyright © 2017 Matheus Coelho Espinasso. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivBeerImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    
    static let lbAbvDefaultText = "Teor alcoólico:"
}
