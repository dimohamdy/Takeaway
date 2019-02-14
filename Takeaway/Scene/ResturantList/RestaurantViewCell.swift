//
//  ItemTableViewCell.swift
//  Scout
//
//  Created by BinaryBoy on 12/8/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

class RestaurantViewCell: UITableViewCell,CellReusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var sortValueLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var sortOption:SortOptions!
    var restaurant:Restaurant? = nil {
        didSet {
            guard let restaurant = restaurant else {
                return
            }
            
            nameLabel.text =  restaurant.name
            statusLabel.text =  restaurant.status
            
            guard let sortingValues = restaurant.sortingValues,let sortType = sortOption else {
                return
            }
            var sortValue:String!
            
            switch sortType {
            case .bestMatch:
                sortValue = "\(sortingValues.bestMatch)"
            case .newest:
                sortValue = "\(sortingValues.bestMatch)"
            case .ratingAverage:
                sortValue = "\(sortingValues.ratingAverage)"
            case .distance:
                sortValue = "\(sortingValues.distance)"
            case .popularity:
                sortValue = "\(sortingValues.popularity)"
            case .averageProductPrice:
                sortValue = "\(sortingValues.averageProductPrice)"
            case .deliveryCosts:
                sortValue = "\(sortingValues.deliveryCosts)"
            case .minimumCost:
                sortValue = "\(sortingValues.minCost)"
                
            }
            sortValueLabel.text =  sortValue
            
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
