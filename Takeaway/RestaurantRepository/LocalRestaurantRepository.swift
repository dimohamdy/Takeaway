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

    func getRestaurants()->[Restaurant] {
        let decoder = JSONDecoder()

        guard let data = getData(), let result = try? decoder.decode(Result.self, from: data), let restaurants = result.restaurants, restaurants.count > 0 else {
            return []         
        }

        return restaurants
    }
}
