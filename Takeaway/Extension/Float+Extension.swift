//
//  Float+Extension.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/17/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation

extension Float {
    func distanceInKM() -> String {
        return "\(String(format: "%.1f",self/1000)) km"
    }
}
