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
    /// Filtered and Sorted List of restaruants
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
        switch sortOption {
        case .bestMatch:
            filteredRestaurants.sort(by: { $0.sortingValues?.bestMatch ?? 0 > $1.sortingValues?.bestMatch ?? 0 })
        case .newest:
            filteredRestaurants.sort(by: { $0.sortingValues?.newest ?? 0 > $1.sortingValues?.newest ?? 0 })
            
        case .ratingAverage:
            filteredRestaurants.sort(by: { $0.sortingValues?.ratingAverage ?? 0 > $1.sortingValues?.ratingAverage ?? 0 })
            
        case .distance:
            filteredRestaurants.sort(by: { $0.sortingValues?.distance ?? 0 < $1.sortingValues?.distance ?? 0})
            
        case .popularity:
            filteredRestaurants.sort(by: { $0.sortingValues?.popularity ?? 0 > $1.sortingValues?.popularity ?? 0 })
            
        case .averageProductPrice:
            filteredRestaurants.sort(by: { $0.sortingValues?.averageProductPrice ?? 0 < $1.sortingValues?.averageProductPrice ?? 0})
            
        case .deliveryCosts:
            filteredRestaurants.sort(by: { $0.sortingValues?.deliveryCosts ?? 0 < $1.sortingValues?.deliveryCosts ?? 0 })
            
        case .minimumCost:
            filteredRestaurants.sort(by: { $0.sortingValues?.minCost ?? 0 < $1.sortingValues?.minCost ?? 0 })
            
        }
    }
    private func sortWithStatus() {
        filteredRestaurants.sort{return ($0.resturantState.value < $1.resturantState.value )}
    }
    
    private func sortWithFavourite() {
        filteredRestaurants.sort{return ($0.isFavorite && !$1.isFavorite)}
    }
    
    func searchTermUpdated(_ searchString : String) {
        filteredRestaurants = searchString.isEmpty ? restaurants :  restaurants.filter{ $0.name?.lowercased().range(of: searchString.lowercased()) != nil }
        sortRestaurants(sortOption: self.sortOption)
    }

}

