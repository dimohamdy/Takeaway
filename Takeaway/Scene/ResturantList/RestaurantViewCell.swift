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
    @IBOutlet weak var sortKeyLabel: UILabel!
    @IBOutlet weak var sortValueLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var sortOption:SortOptions!
    var restaurant:Restaurant? = nil {
        didSet {
            guard let restaurant = restaurant else {
                return
            }
            //            restaurant.isFavorite =  CoreDataManager.isFavoriteItem(id: item.id)
            
            nameLabel.text =  restaurant.name
            statusLabel.text =  restaurant.status
            
            guard let sortingValues = restaurant.sortingValues,let sortType = sortOption else {
                return
            }
            var sortValue:String!
            
            switch sortType {
            case .bestMatch:
                sortValue = sortingValues.bestMatch.asStringOrEmpty()
            case .newest:
                sortValue = sortingValues.bestMatch.asStringOrEmpty()
            case .ratingAverage:
                sortValue = sortingValues.ratingAverage.asStringOrEmpty()
            case .distance:
                sortValue = sortingValues.distance.asStringOrEmpty()
            case .popularity:
                sortValue = sortingValues.popularity.asStringOrEmpty()
            case .averageProductPrice:
                sortValue = sortingValues.averageProductPrice.asStringOrEmpty()
            case .deliveryCosts:
                sortValue = sortingValues.deliveryCosts.asStringOrEmpty()
            case .minimumCost:
                sortValue = sortingValues.minCost.asStringOrEmpty()
                
            }
            sortValueLabel.text =  sortValue
            
            (restaurant.isFavorite == true ) ?  favoriteButton.setImage(#imageLiteral(resourceName: "fill_favorite"), for: .normal) : favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            
            
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        guard let restaurant = restaurant else {
            return
        }
        //        if restaurant.isFavorite {
        ////            restaurant.isFavorite = false
        ////            CoreDataManager.removeItemToFavorites(item: item)
        //            favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        //        } else {
        ////            restaurant.isFavorite = true
        ////            CoreDataManager.addItemToFavorites(item: item)
        //            favoriteButton.setImage(#imageLiteral(resourceName: "fill_favorite"), for: .normal)
        //        }
        
    }
}
extension Optional {
    func asStringOrEmpty() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
}
