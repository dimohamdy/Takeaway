//
//  RestaurantViewCell.swift
//  Takeaway
//
//  Created by BinaryBoy on 12/8/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

class RestaurantViewCell: UITableViewCell,CellReusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var sortOption:SortOptions!
    var restaurant:Restaurant? = nil {
        didSet {
            guard let restaurant = restaurant,let sortingValues = restaurant.sortingValues  else {
                return
            }
            
            nameLabel.text =  restaurant.name
            statusLabel.text = "Status : \((restaurant.status ?? "").uppercased())\nDistance : \(sortingValues.distance.distanceInKM())  MinCost:€\(sortingValues.minCost)\nPopularity : \(sortingValues.popularity)    BestMatch:\(sortingValues.bestMatch) "
            
            
            (restaurant.isFavorite == true ) ?  favoriteButton.setImage(#imageLiteral(resourceName: "fill_favorite"), for: .normal) : favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            
        }
    }    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        guard let restaurant = restaurant else {
            return
        }
        if restaurant.isFavorite {
            LocalRestaurantRepository.removeRestaurantToFavorite(restaurant: restaurant)
            favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        } else {
            LocalRestaurantRepository.addRestaurantToFavorite(restaurant: restaurant)
            favoriteButton.setImage(#imageLiteral(resourceName: "fill_favorite"), for: .normal)
        }
        
    }
}
