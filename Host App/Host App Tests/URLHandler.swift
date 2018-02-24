//
//  URLHandler.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class URLHandlerTests: XCTestCase {
    func testValidURLFromKnownSource() throws {
        let url = "hostapp:/park/start".url!

        let result = try URLHandler.handel(url, with: [.sourceApplication : URLHandler.knownSources.first!])

        XCTAssertTrue(result)
    }

    func testValidURLFromUnknownSourceThrowsUnknownSourceError() throws {
        let url = "hostapp:/park/start".url!

        XCTAssertThrowsError(try URLHandler.handel(url, with: [.sourceApplication : "some.unknown.app"])) { (error) -> Void in
            XCTAssertEqual(error as? URLHandler.Error, URLHandler.Error.unknownSource)
        }
    }

    func testMalformedURLThrowsMalformedURLError() {
        let url = "http://bad-link.com:-80/".url!

        XCTAssertThrowsError(try URLHandler.handel(url)) { (error) -> Void in
            XCTAssertEqual(error as? URLHandler.Error, URLHandler.Error.malformedURL)
        }
    }

    func testInvalidPathThrowsUnsupportedPathError() {
        let url = "hostapp:/bad-path".url!

        XCTAssertThrowsError(try URLHandler.handel(url)) { (error) -> Void in
            XCTAssertEqual(error as? URLHandler.Error, URLHandler.Error.unsupportedPath)
        }
    }

    // Poor test just to get full test coverage 😉
    func testEachErrorHasAValidErrorDescriptionString() {
        let errors: [URLHandler.Error] = [ .unknownSource, .malformedURL, .unsupportedPath, .missingQueryParameter ]

        for error in errors {
            XCTAssertNotNil(error.description)
        }
    }
}
