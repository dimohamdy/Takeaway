//
//  LocalWeatherRepository.swift
//  Takeaway
//
//  Created by BinaryBoy on 31/1/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class LocalRestaurantRepository: RestaurantRepository {

    static func getRestaurantsFromJSONFile()->[Restaurant] {
        let decoder = JSONDecoder()

        guard let data = getDataFromLocalJSON(), let result = try? decoder.decode(Result.self, from: data), let restaurants = result.restaurants, restaurants.count > 0 else {
            return []         
        }

        return restaurants
    }
    
    static func getRestaurantsFromDB()->[Restaurant]{
        return Array(RealmManager.realm.objects(Restaurant.self))
    }

    
    static func saveRestaurants(restaurants:[Restaurant]){
        restaurants.forEach { restaurant in
            RealmManager.write {
                RealmManager.realm.add(restaurant)
            }
        }
    }
    
    static func getNonFavoriatesRestaurants()->[Restaurant]{
        
        return Array(RealmManager.realm.objects(Restaurant.self).filter("isFavorite == %@", false))
    }

    static func getFavoriatesRestaurants()->[Restaurant]{
        
        return Array(RealmManager.realm.objects(Restaurant.self).filter("isFavorite == %@", true))
    }
    
    static func addRestaurantToFavorite(restaurant:Restaurant){
        RealmManager.write {
            restaurant.isFavorite = true
        }
    }
    
    static func removeRestaurantToFavorite(restaurant:Restaurant){
        RealmManager.write {
            restaurant.isFavorite = false
        }
    }

}
