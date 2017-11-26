//
//  BeersTableViewController.swift
//  31781
//
//  Created by Matheus Coelho Espinasso on 21/11/17.
//  Copyright © 2017 Matheus Coelho Espinasso. All rights reserved.
//

import UIKit
import Kingfisher

class BeersTableViewController: UITableViewController {
    
    var dataSource: [Beer] = []
    var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeers()
    }
    
    func loadBeers() {
        activityIndicator.startAnimating()
        
        REST.loadBeers { (beers: [Beer]?) in
            if let beers = beers {
                self.dataSource = beers
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    func prepareActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        let beer = dataSource[indexPath.row]
        
        let resource = ImageResource(downloadURL: URL(string: beer.imageUrl)!, cacheKey: beer.imageUrl)
        
        cell.lbName.text = beer.name
        cell.lbAbv.text = "\(BeerTableViewCell.lbAbvDefaultText) \(beer.abv)"
        cell.ivBeerImage.kf.setImage(with: resource)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BeerViewController {
            vc.beer = dataSource[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}
