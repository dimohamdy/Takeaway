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
        viewModel.sortRestaurants(sortOption: .bestMatch)
        
        // FilteredModels are default sorted by status
        guard let firstRestaurant = viewModel.filteredRestaurants.first,let lastRestaurant = viewModel.filteredRestaurants.last else {
            XCTAssert(false)
            return
        }
        XCTAssertGreaterThan(firstRestaurant.resturantState.rawValue, lastRestaurant.resturantState.rawValue)
    }
    
    func testSearch() {
        viewModel.searchTermUpdated("Tan")
        let randomIndex = Int.random(in: 0 ..< viewModel.filteredRestaurants.count)
        if let name = viewModel.filteredRestaurants[randomIndex].name {
            XCTAssert(name.contains("Tan"))
        }else{
            XCTAssert(false)
        }
    }
}
