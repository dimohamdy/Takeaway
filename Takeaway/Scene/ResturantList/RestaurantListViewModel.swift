//
//  RestaurantListViewModel.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/11/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

protocol ViewModelDelegate: class {
    func updateData(restaurants: [Restaurant],sortOption:SortOptions)
}

class RestaurantListViewModel {
    
    // input
    var sortOption:SortOptions = .bestMatch

    // output
    var restaurants:[Restaurant] = []
    weak var delegate: ViewModelDelegate?

    init(restaurantRepository:RestaurantRepository.Type) {
        restaurants = restaurantRepository.getRestaurantsFromDB()
    }
    func sortRestaurants(sortOption:SortOptions) {
        self.sortOption = sortOption
        sortForValues()
        sortWithStatus()
        sortWithFavourite()
        delegate?.updateData(restaurants: self.restaurants, sortOption: self.sortOption)
    }
    
    private func sortForValues() {
        switch sortOption {
        case .bestMatch:
            restaurants.sort(by: { $0.sortingValues?.bestMatch ?? 0 > $1.sortingValues?.bestMatch ?? 0 })
        case .newest:
            restaurants.sort(by: { $0.sortingValues?.newest ?? 0 > $1.sortingValues?.newest ?? 0 })
            
        case .ratingAverage:
            restaurants.sort(by: { $0.sortingValues?.ratingAverage ?? 0 > $1.sortingValues?.ratingAverage ?? 0 })
            
        case .distance:
            restaurants.sort(by: { $0.sortingValues?.distance ?? 0 < $1.sortingValues?.distance ?? 0})
            
        case .popularity:
            restaurants.sort(by: { $0.sortingValues?.popularity ?? 0 > $1.sortingValues?.popularity ?? 0 })
            
        case .averageProductPrice:
            restaurants.sort(by: { $0.sortingValues?.averageProductPrice ?? 0 < $1.sortingValues?.averageProductPrice ?? 0})
            
        case .deliveryCosts:
            restaurants.sort(by: { $0.sortingValues?.deliveryCosts ?? 0 < $1.sortingValues?.deliveryCosts ?? 0 })
            
        case .minimumCost:
            restaurants.sort(by: { $0.sortingValues?.minCost ?? 0 < $1.sortingValues?.minCost ?? 0 })
            
        }
    }
    private func sortWithStatus() {
        restaurants.sort{return ($0.resturantState.value < $1.resturantState.value )}
    }
    
    private func sortWithFavourite() {
        restaurants.sort{return ($0.isFavorite && !$1.isFavorite)}
    }
}

enum ResturantState: String {
    case closed = "closed"
    case canOrderAhead =  "order ahead"
    case open = "open"
    
    var value: Int {
        switch self {
        case .closed:
            return 0
        case .canOrderAhead:
            return 1
        case .open:
            return 2
        }
    }
}


enum SortOptions : Int {
    case bestMatch = 0
    case newest
    case ratingAverage
    case distance
    case popularity
    case averageProductPrice
    case deliveryCosts
    case minimumCost
    
    static var allCases: [String] {
        return ["best match", "newest",
                "rating average", "distance", "popularity", "average product price", "delivery costs","minimum cost"]
    }
}
