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
    // Filtered and Sorted List of restaruants
    var filteredRestaurants : [Restaurant]!
    
    weak var delegate: ViewModelDelegate?
    
    init(restaurantRepository:RestaurantRepository.Type) {
        restaurants = restaurantRepository.getRestaurantsFromDB()
        filteredRestaurants = restaurants
    }
    func sortRestaurants(sortOption:SortOptions) {
        self.sortOption = sortOption
        sortForValues()
        sortWithStatus()
        sortWithFavourite()
        delegate?.updateData(restaurants: filteredRestaurants, sortOption: sortOption)
    }
    
    private func sortForValues() {
        
        
        filteredRestaurants.sort(by: {
            guard let sortingValues1 = $0.sortingValues,let sortingValues2 = $1.sortingValues else {
                return false
            }
            switch sortOption {
            case .bestMatch:
                return sortingValues1.bestMatch > sortingValues2.bestMatch
            case .newest:
                return sortingValues1.newest  > sortingValues2.newest
            case .ratingAverage:
                return sortingValues1.ratingAverage > sortingValues2.ratingAverage
            case .distance:
                return sortingValues1.distance < sortingValues2.distance
            case .popularity:
                return sortingValues1.popularity > sortingValues2.popularity
            case .averageProductPrice:
                return sortingValues1.averageProductPrice < sortingValues2.averageProductPrice
            case .deliveryCosts:
                return sortingValues1.deliveryCosts < sortingValues2.deliveryCosts
            case .minimumCost:
                return sortingValues1.minCost < sortingValues2.minCost
                
            }
        })
        
    }    
    
    private func sortWithStatus() {
        filteredRestaurants.sort{return ($0.resturantState.value > $1.resturantState.value )}
    }
    
    private func sortWithFavourite() {
        filteredRestaurants.sort{return ($0.isFavorite && !$1.isFavorite)}
    }
    
    func searchTermUpdated(_ searchString : String) {
        filteredRestaurants = searchString.isEmpty ? restaurants :  restaurants.filter{ $0.name?.lowercased().range(of: searchString.lowercased()) != nil }
        sortRestaurants(sortOption: self.sortOption)
    }
    
}

