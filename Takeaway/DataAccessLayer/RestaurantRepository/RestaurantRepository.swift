//
//  DataSource.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation
protocol RestaurantRepository {
    static func getRestaurantsFromJSONFile()->[Restaurant]
    static func getRestaurantsFromDB()->[Restaurant]
    static func saveRestaurants(restaurants:[Restaurant])
    static func getFavoriatesRestaurants()->[Restaurant]
    static func addRestaurantToFavorite(restaurant:Restaurant)
    static func removeRestaurantToFavorite(restaurant:Restaurant)
}
