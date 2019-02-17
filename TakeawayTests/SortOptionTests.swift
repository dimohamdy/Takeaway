//
//  SortOptionTests.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 2/14/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Takeaway

class SortOptionTests: XCTestCase {

    func testSortOptions(){
     // Assert: Number of category.
     XCTAssertEqual(SortOptions.allCases.count, 8)
    }

}
