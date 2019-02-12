//
//  TableViewDataSource.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/3/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var restaurants: [Restaurant]!
    var sortOption: SortOptions!

    init(restaurants: [Restaurant],sortOption:SortOptions) {
        self.restaurants = restaurants
        self.sortOption = sortOption
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        if let cell: RestaurantViewCell = tableView.dequeueReusableCell(for: indexPath) {
            cell.sortOption = sortOption
            cell.restaurant = restaurant
            return cell
        }        
        return UITableViewCell()
    }

}
