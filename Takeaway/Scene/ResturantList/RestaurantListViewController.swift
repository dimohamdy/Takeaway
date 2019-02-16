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
    //    fileprivate let router: RestaurantListRouter
    
    @IBOutlet weak var resturantTableView: UITableView!
    @IBOutlet weak var selectOperatorButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var tableViewDataSource:TableViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
   
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
        setupSortOptionsDropDown()
    }
    func setupSortOptionsDropDown() {
        let options:[String] = SortOptions.allCases
        var actions: [(String, UIAlertAction.Style)] = []
        options.forEach { optionText in
            actions.append((optionText, UIAlertAction.Style.default))
        }

        Alerts.showActionsheet(viewController: self, title: "Select Sort Option", message: "", actions: actions) { (index) in
            if let sortOptions = SortOptions(rawValue: index)  {
                self.viewModel.sortResults(sortOption: sortOptions)
                let optionText = options[index]
                self.selectOperatorButton.setTitle(optionText, for: .normal)
                
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

struct Alerts {
    static func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        viewController.present(alertViewController, animated: true, completion: nil)
    }
}
