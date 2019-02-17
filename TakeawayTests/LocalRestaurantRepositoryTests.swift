//
//  LocalRestaurantRepositoryTests.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 2/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Takeaway

class LocalRestaurantRepositoryTests: XCTestCase {
    
    override func setUp() {
        //get data from JSON and add it to DataBase
        
        RealmManager.write {
            RealmManager.realm.deleteAll()
        }
        //get data from json and then save it to database and use it
        let restaurants = LocalRestaurantRepository.getRestaurantsFromJSONFile()
        LocalRestaurantRepository.saveRestaurants(restaurants: restaurants)
        
        LocalRestaurantRepository.setupDataBase()

    }

    func testGetItemsFromDB() {
        // Act: get data from API .
        let restaurants = LocalRestaurantRepository.getRestaurantsFromDB()
        // Assert: Verify it's have a data.
        XCTAssertGreaterThan(restaurants.count, 0)
        XCTAssertEqual(restaurants.count, 10)

    }
    
    func testGetItemsFromJSON() {
        // Act: get data from API .
        let restaurants = LocalRestaurantRepository.getRestaurantsFromJSONFile()
        // Assert: Verify it's have a data.
        XCTAssertGreaterThan(restaurants.count, 0)
        XCTAssertEqual(restaurants.count, 10)
    }
    
    
    func testSaveRestaurants() {
        let restaurantsFromJSON = LocalRestaurantRepository.getRestaurantsFromJSONFile()
        // Act: get data from API .
        LocalRestaurantRepository.saveRestaurants(restaurants: restaurantsFromJSON)
        let restaurantsFromDB = LocalRestaurantRepository.getRestaurantsFromDB()

        // Assert: Verify it's have a data.
        XCTAssertGreaterThan(restaurantsFromJSON.count, restaurantsFromDB.count)
        XCTAssertEqual(restaurantsFromDB.count, 10)
        
    }
    
    
    func testRestaurantToFavorite() {
        
        var favoriatesRestaurants = LocalRestaurantRepository.getFavoriatesRestaurants()
        XCTAssertEqual(favoriatesRestaurants.count, 0)
        let restaurants = LocalRestaurantRepository.getRestaurantsFromDB()
        let restaurant = restaurants[0]
        
        
        //add restaurant to favorite
        LocalRestaurantRepository.addRestaurantToFavorite(restaurant: restaurant)
        favoriatesRestaurants = LocalRestaurantRepository.getFavoriatesRestaurants()
        XCTAssertEqual(favoriatesRestaurants.count, 1)
        
        //remove restaurant from favorite
        LocalRestaurantRepository.removeRestaurantToFavorite(restaurant: restaurant)
        favoriatesRestaurants = LocalRestaurantRepository.getFavoriatesRestaurants()
        XCTAssertEqual(favoriatesRestaurants.count, 0)

    }
}
