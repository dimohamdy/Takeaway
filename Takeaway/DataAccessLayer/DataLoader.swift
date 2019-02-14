//
//  DataLoader.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 31/1/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation

func getDataFromLocalJSON() -> Data? {

    guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") else {
        return nil
    }
    do {
        let content = try String(contentsOfFile: path)
        let data: Data? = content.data(using: .utf8) // non-nil
        return data
    } catch {
        return nil
    }
}
