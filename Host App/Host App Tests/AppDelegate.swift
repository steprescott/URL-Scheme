//
//  AppDelegate.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class AppDelegateTests: XCTestCase {

    func testCanOpenValidURL() {
        let sut = AppDelegate()
        let url = "hostapp:/park/start".url!

        let result = sut.application(.shared, open: url, options: [:])

        XCTAssertTrue(result)
    }

    func testErrorIsThrownForInvalidURL() {
        let sut = AppDelegate()
        let url = "hostapp:/bad-url".url!

        let result = sut.application(.shared, open: url, options: [:])

        XCTAssertFalse(result)
    }
    
}
