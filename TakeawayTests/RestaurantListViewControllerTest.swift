//
//  CategoryListViewControllerTest.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 2/14/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Takeaway

class RestaurantListViewControllerTest: XCTestCase {
    
    var restaurantListViewController: RestaurantListViewController!
    
    override func setUp() {
        
        // Arrange: setup ViewController with data source
        self.restaurantListViewController = RestaurantListBuilder.viewController(dataSource: LocalRestaurantRepository.self) as? RestaurantListViewController
        self.restaurantListViewController.loadView()
        self.restaurantListViewController.viewDidLoad()
    }
    
    func testSelectCategory() {
        
        // Arrange: setup UINavigationController

        let navigationController = MockNavigationController(rootViewController: restaurantListViewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController

        if let resturantTableView = restaurantListViewController.resturantTableView {
          let numberOfCell  = resturantTableView.numberOfRows(inSection: 0)
            XCTAssertEqual(LocalRestaurantRepository.getRestaurantsFromDB().count, numberOfCell)
        }

    }
}

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
