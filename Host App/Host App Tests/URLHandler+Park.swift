//
//  URLHandler+Park.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class URLHandler_Park: XCTestCase {
    func testValidParkURLWithValidQueryParameter() throws {
        let url = "hostapp:/park?start=true".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidParkURLWithInvalidQueryParameterKey() throws {
        let url = "hostapp:/park?bad=true".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidParkURLWithInvalidQueryParameterValue() throws {
        let url = "hostapp:/park?start=bad".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidParkStartURL() throws {
        let url = "hostapp:/park/start".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidParkStopURL() throws {
        let url = "hostapp:/park/stop".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }
}
