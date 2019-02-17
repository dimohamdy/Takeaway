//
//  RestaurantListViewModelTest.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 2/17/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Takeaway

class RestaurantListViewModelTest: XCTestCase {

    var viewModel :  RestaurantListViewModel!
    override func setUp() {
        super.setUp()
        viewModel = RestaurantListViewModel(restaurantRepository: LocalRestaurantRepository.self)
    }
    
    func testLoadData() {
        
        XCTAssertGreaterThan(viewModel.restaurants.count, 0)
        XCTAssertTrue(viewModel.sortOption == .bestMatch)
    }
    
    func testSortByRatings(){
        guard let firstRestaurant = viewModel.restaurants.first,let firstSortingValues = firstRestaurant.sortingValues,let lastRestaurant = viewModel.restaurants.last,let lastSortingValues = lastRestaurant.sortingValues else {
            XCTAssert(false)
            return
        }
        viewModel.sortRestaurants(sortOption: .ratingAverage)
        XCTAssertGreaterThan(firstSortingValues.ratingAverage, lastSortingValues.ratingAverage)
    }
    
    
    func testSortByDistance(){
        
        viewModel.sortRestaurants(sortOption: .distance)
        guard let firstRestaurant = viewModel.restaurants.first,let firstSortingValues = firstRestaurant.sortingValues,let lastRestaurant = viewModel.restaurants.last,let lastSortingValues = lastRestaurant.sortingValues else {
            XCTAssert(false)
            return
        }
        XCTAssertLessThan(firstSortingValues.distance, lastSortingValues.distance)
    }
    
    func testSortByMinCost(){
        viewModel.sortRestaurants(sortOption: .minimumCost)
        guard let firstRestaurant = viewModel.restaurants.first,let firstSortingValues = firstRestaurant.sortingValues,let lastRestaurant = viewModel.restaurants.last,let lastSortingValues = lastRestaurant.sortingValues else {
            XCTAssert(false)
            return
        }
        XCTAssertLessThan(firstSortingValues.minCost, lastSortingValues.minCost)
    }
    
    func testSortByStatus(){
        // FilteredModels are default sorted by status
        guard let firstRestaurant = viewModel.restaurants.first,let lastRestaurant = viewModel.restaurants.last else {
            XCTAssert(false)
            return
        }
        XCTAssertLessThan(firstRestaurant.resturantState.rawValue, lastRestaurant.resturantState.rawValue)
    }


}
