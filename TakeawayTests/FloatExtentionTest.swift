//
//  FloatExtentionTest.swift
//  TakeawayTests
//
//  Created by BinaryBoy on 2/17/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Takeaway

class FloatExtentionTest: XCTestCase {

    func testConvertDistanceToString() {
        let distanceInMeter:Float = 2500
        XCTAssertEqual(distanceInMeter.distanceInKM(), "2.5 km")
    }
}
