//
//  ReusableCellView.swift
//  Takeaway
//
//  Created by BinaryBoy on 12/8/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

protocol CellReusable: class {
    static var identifier: String {get}
}

extension CellReusable {
    static var identifier: String {
        return "\(self)"
    }
}
