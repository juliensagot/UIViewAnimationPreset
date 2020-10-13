//
//  TimeInterval+DispatchTimeInterval_Tests.swift
//  
//  Created by Julien SAGOT on 13/11/2020.
//  Copyright © 2020 Julien Sagot. All rights reserved.
//

import XCTest
@testable import UIViewAnimatePreset

final class TimeIntervalDispatchTimeIntervalTests: XCTestCase {

    func testDispatchTimeIntervalInitializer() {
        // Seconds
        do {
            let dispatchTimeInterval = DispatchTimeInterval.seconds(4)
            XCTAssertEqual(TimeInterval(dispatchTimeInterval: dispatchTimeInterval), 4)
        }
        // Milliseconds
        do {
            let dispatchTimeInterval = DispatchTimeInterval.milliseconds(400)
            XCTAssertEqual(TimeInterval(dispatchTimeInterval: dispatchTimeInterval), 0.4)
        }
        // Microseconds
        do {
            let dispatchTimeInterval = DispatchTimeInterval.microseconds(375000)
            XCTAssertEqual(TimeInterval(dispatchTimeInterval: dispatchTimeInterval), 0.375)
        }
        // Nanoseconds
        do {
            let dispatchTimeInterval = DispatchTimeInterval.nanoseconds(1557500000)
            XCTAssertEqual(TimeInterval(dispatchTimeInterval: dispatchTimeInterval), 1.5575)
        }
    }
}
