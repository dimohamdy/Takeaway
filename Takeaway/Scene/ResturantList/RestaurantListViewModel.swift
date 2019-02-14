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
//    let restaurantRepository:RestaurantRepository!
    var sortOption:SortOptions!

    // output
    let restaurants:[Restaurant]!
    // output
    weak var delegate: ViewModelDelegate?

    init(restaurantRepository:RestaurantRepository.Type) {
        restaurants = restaurantRepository.getRestaurantsFromDB()
    }

    func getFavoritesRestaurants() -> [Restaurant]{
        let topRestaurants =  restaurants.filter { restaurant -> Bool in
            return restaurant.isFavorite 
        }
        return topRestaurants
    }
    
    func getNonFavoritesRestaurants() -> [Restaurant]{
        let topRestaurants =  restaurants.filter { restaurant -> Bool in
            return !(restaurant.isFavorite )
        }
        return topRestaurants
    }
    
    func sortDependOnStatus() -> [Restaurant]{
        let topRestaurants =  restaurants.filter { restaurant -> Bool in
            return restaurant.isFavorite 
        }
        return topRestaurants
    }
    
    func sort(sortOption:SortOptions,restaurants:[Restaurant]) -> [Restaurant] {
        self.sortOption = sortOption
        let sortedrestaurants:[Restaurant]
        switch sortOption {
        case .bestMatch:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.bestMatch ?? 0 > $1.sortingValues?.bestMatch ?? 0 })
            return sortedrestaurants
        case .newest:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.newest ?? 0 > $1.sortingValues?.newest ?? 0 })
            return sortedrestaurants
        case .ratingAverage:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.ratingAverage ?? 0 > $1.sortingValues?.ratingAverage ?? 0 })
            return sortedrestaurants
        case .distance:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.distance ?? 0 > $1.sortingValues?.distance ?? 0})
            return sortedrestaurants
        case .popularity:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.popularity ?? 0 > $1.sortingValues?.popularity ?? 0 })
            return sortedrestaurants
        case .averageProductPrice:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.averageProductPrice ?? 0 > $1.sortingValues?.averageProductPrice ?? 0})
            return sortedrestaurants
        case .deliveryCosts:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.deliveryCosts ?? 0 > $1.sortingValues?.deliveryCosts ?? 0 })
            return sortedrestaurants
        case .minimumCost:
            sortedrestaurants = restaurants.sorted(by: { $0.sortingValues?.minCost ?? 0 > $1.sortingValues?.minCost ?? 0 })
            return sortedrestaurants
        }
    }
    
    func sortedRestaurants(sortOptions:SortOptions) /*-> [Restaurant] */{
        let sortedFavoriatesRestaurants = sort(sortOption: sortOptions, restaurants: getFavoritesRestaurants())
        let sortedNonFavoriatesRestaurants =  sort(sortOption: sortOptions, restaurants: getNonFavoritesRestaurants())

        
        let result =  sortedFavoriatesRestaurants + sortedNonFavoriatesRestaurants
        delegate?.updateData(restaurants: result, sortOption: sortOption)
//        return result
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


enum SortOptions : Int{
    case bestMatch = 0
    case newest
    case ratingAverage
    case distance
    case popularity
    case averageProductPrice
    case deliveryCosts
    case minimumCost
}
