//
//  Beer.swift
//  31781
//
//  Created by Matheus Coelho Espinasso on 21/11/17.
//  Copyright © 2017 Matheus Coelho Espinasso. All rights reserved.
//

import Foundation

class Beer {
    var id: Int
    var name: String
    var tagline: String
    var description: String
    var abv: Double
    var ibu: Double?
    var imageUrl: String
    
    init(id: Int, name: String, tagline: String, description: String, abv: Double, ibu: Double?, imageUrl: String) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.abv = abv
        self.ibu = ibu
        self.imageUrl = imageUrl
    }
}
