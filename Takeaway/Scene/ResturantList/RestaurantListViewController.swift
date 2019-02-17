//
//  RestaurantListViewController.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/11/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {
    var viewModel: RestaurantListViewModel!
    
    @IBOutlet weak var resturantTableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var tableViewDataSource:TableViewDataSource!
    var resultSearchController = UISearchController()
    
    var searchTask: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        tableViewDataSource = TableViewDataSource(restaurants: viewModel.restaurants, sortOption: .bestMatch)
        
        resturantTableView.delegate = tableViewDataSource
        resturantTableView.dataSource = tableViewDataSource
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resturantTableView.reloadData()
    }

    @objc func showSortOptions() {
        let options:[String] = SortOptions.allCases
        var actions: [(String, UIAlertAction.Style)] = []
        options.forEach { optionText in
            actions.append((optionText, UIAlertAction.Style.default))
        }
        
        AlertsFactory.showActionsheet(viewController: self, title: "Select Sort Option", message: "", actions: actions, checkIndex: viewModel.sortOption.rawValue) { (index) in
            if let sortOptions = SortOptions(rawValue: index)  {
                self.viewModel.sortRestaurants(sortOption: sortOptions)
            }
        }
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

extension RestaurantListViewController {
    func setupUI() {
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
            self.navigationItem.largeTitleDisplayMode = .always
        }
        self.title = "Resturant"
        resturantTableView.scrollIndicatorInsets = resturantTableView.contentInset
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
            self.navigationItem.largeTitleDisplayMode = .always
        }
        navigationItem.hidesSearchBarWhenScrolling = true
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.barStyle = UIBarStyle.black
            controller.searchBar.barTintColor = UIColor.white
            controller.searchBar.backgroundColor = UIColor.clear
            self.resturantTableView.tableHeaderView = controller.searchBar
            self.navigationController?.navigationItem.searchController = resultSearchController
            return controller
        })()
        
        
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(#imageLiteral(resourceName: "filter"), for: .normal)
        filterButton.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        filterButton.addTarget(self, action:#selector(RestaurantListViewController.showSortOptions), for:.touchUpInside)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: filterButton)]
    }
}
extension  RestaurantListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text {
            // Cancel previous task if any
            searchTask?.cancel()
            // Replace previous task with a new one
            let task = DispatchWorkItem { [weak self] in
                self?.viewModel.searchTermUpdated(query)
            }
            self.searchTask = task
            // Execute task in 0.75 seconds (if not cancelled !)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: task)
        }
        
    }
}
