//
//  AlertsFactory.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/17/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

struct AlertsFactory {
    static func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)],checkIndex:Int, completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            if checkIndex ==  index {
                alertAction.setValue(true, forKey: "checked")
            }
            
            alertViewController.addAction(alertAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertViewController.addAction(cancelAction)
        viewController.present(alertViewController, animated: true, completion: nil)
    }
}
