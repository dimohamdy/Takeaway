//
//  DataSource.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation
protocol RestaurantRepository {
    func getRestaurants()->[Restaurant]
}
