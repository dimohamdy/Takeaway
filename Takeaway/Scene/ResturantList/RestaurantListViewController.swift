//
//  RestaurantListViewController.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/11/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit
import DropDown

class RestaurantListViewController: UIViewController {
    var viewModel: RestaurantListViewModel!
    //    fileprivate let router: RestaurantListRouter
    
    @IBOutlet weak var resturantTableView: UITableView!
    let sortOptionDropDown = DropDown()
    @IBOutlet weak var selectOperatorButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var tableViewDataSource:TableViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupSortOptionsDropDown()
        sortOptionDropDown.dismissMode = .automatic
        sortOptionDropDown.direction = .any
        
        viewModel.delegate = self
        
        tableViewDataSource = TableViewDataSource(restaurants: viewModel.restaurants, sortOption: .bestMatch)
        
        resturantTableView.delegate = tableViewDataSource
        resturantTableView.dataSource = tableViewDataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resturantTableView.reloadData()
    }
    @IBAction func showSortOptions(_ sender: UIButton) {
        sortOptionDropDown.show()
    }
    func setupSortOptionsDropDown() {
        sortOptionDropDown.anchorView = selectOperatorButton
        sortOptionDropDown.bottomOffset = CGPoint(x: 0, y: selectOperatorButton.bounds.height)
        
        sortOptionDropDown.dataSource = ["best match", "newest",
                                         "rating average", "distance", "popularity", "average product price", "delivery costs","minimum cost"]
        // Action triggered on selection
        sortOptionDropDown.selectionAction = { [weak self] (index, item) in
            
            if let sortOptions = SortOptions(rawValue: index)  {
                self?.viewModel.sortedRestaurants(sortOptions: sortOptions)
                self?.selectOperatorButton.setTitle(item, for: .normal)
                
            }
            
        }
        sortOptionDropDown.selectRow(0)

    }
}
extension  RestaurantListViewController: ViewModelDelegate {
    func updateData(restaurants: [Restaurant],sortOption:SortOptions){
        tableViewDataSource = TableViewDataSource(restaurants: restaurants, sortOption: sortOption)
        DispatchQueue.main.async {
            self.resturantTableView.dataSource = self.tableViewDataSource
            self.resturantTableView.delegate = self.tableViewDataSource
            self.resturantTableView.reloadData()
        }
    }
    
}
