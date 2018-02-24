//
//  Sequence.swift
//  Host App Tests
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import XCTest
@testable import HostApp

class SequenceTests: XCTestCase {

    func testValidKeyAgainstSequenceOfURLQueryItems() {
        let key = "test-key"
        let value = "test-value"

        let items = [ URLQueryItem(name: key, value: value) ]

        let sut = items.itemWithkey(key)

        XCTAssertNotNil(sut)
        XCTAssertTrue(sut!.name == key)
        XCTAssertNotNil(sut!.value)
        XCTAssertTrue(sut!.value == value)
    }

    func testInvalidKeyAgainstSequenceOfURLQueryItems() {
        let key = "test-key"
        let value = "test-value"

        let items = [ URLQueryItem(name: key, value: value) ]

        let sut = items.itemWithkey("bad-key")

        XCTAssertNil(sut)
    }    
}
