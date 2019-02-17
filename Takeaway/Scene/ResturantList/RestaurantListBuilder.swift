//
//  RestaurantListBuilder.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/11/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit

struct RestaurantListBuilder {
    
    static func viewController(dataSource:RestaurantRepository.Type) -> UIViewController {
        let viewModel = RestaurantListViewModel(restaurantRepository: dataSource)
        let viewController = UIStoryboard.instantiateInitialViewController(.main) as! RestaurantListViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
}
