//
//  UITableView+Extention.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/3/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T:CellReusable>(for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
