//
//  REST.swift
//  31781
//
//  Created by Matheus Coelho Espinasso on 21/11/17.
//  Copyright © 2017 Matheus Coelho Espinasso. All rights reserved.
//

import Foundation

class REST {
    
    // MARK: - Configuration
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
       let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    // MARK: - API Access
    static func loadBeers(onComplete: @escaping ([Beer]?) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var beers: [Beer] = []
                    for item in json {
                        let id = item["id"] as! Int
                        let name = item["name"] as! String
                        let tagline = item["tagline"] as! String
                        let description = item["description"] as! String
                        let abv = item["abv"] as! Double
                        let imageUrl = item["image_url"] as! String
                        
                        let ibu: Double?
                        if let ibuAux = item["ibu"] as? Double {
                            ibu = ibuAux
                        } else {
                            ibu = nil
                        }
                        
                        let beer = Beer(id: id, name: name, tagline: tagline, description: description, abv: abv, ibu: ibu, imageUrl: imageUrl)
                        
                        beers.append(beer)
                    }
                    
                    onComplete(beers)
                } else {
                    onComplete(nil)
                }
            }
        }.resume()
    }
}
