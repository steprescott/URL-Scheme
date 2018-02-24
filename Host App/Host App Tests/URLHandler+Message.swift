//
//  URLHandler+Message.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class URLHandler_Message: XCTestCase {

    func testValidMessageURLWithValidQueryParameter() throws {
        let url = "hostapp:/message?string=hello".url!

        let result = try URLHandler.handel(url)

        XCTAssertTrue(result)
    }

    func testValidMessageURLWithInvalidQueryParameter() throws {
        let url = "hostapp:/message?bad=hello".url!

        XCTAssertThrowsError(try URLHandler.handel(url)) { (error) -> Void in
            XCTAssertEqual(error as? URLHandler.Error, URLHandler.Error.missingQueryParameter)
        }
    }
}
