//
//  AssetTest.swift
//  ActivityTrackerTests
//
//  Created by Srinivasan Rajendran on 2022-02-18.
//

import XCTest
@testable import ActivityTracker

class AssetTest: XCTestCase {

    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertFalse(Award.allAwards.isEmpty, "Failed to load awards from JSON")
    }

}
