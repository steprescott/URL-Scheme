//
//  URLHandler+Color.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class URLHandler_Color: XCTestCase {
    func testValidColorURLWithoutQueryParameter() throws {
        let url = "hostapp:/color".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidColorURLWithValidQueryParameter() throws {
        let url = "hostapp:/color?value=red".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    // This example shows that a default value can be used
    func testValidColorURLWithInvalidQueryParameter() throws {
        let url = "hostapp:/color?bad=red".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }
}
