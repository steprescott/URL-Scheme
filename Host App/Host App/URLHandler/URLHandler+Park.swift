//
//  URLHandler+Park.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

extension URLHandler {

    enum Parking {
        enum State: String {
            case start
            case stop
        }
    }

    static func showParking(with queryItems: [URLQueryItem] = []) -> Bool {

        var start = false

        if let item = queryItems.itemWithkey("start"),
            let value = item.value {
            start = NSString(string: value).boolValue
        }

        let state: Parking.State = start ? .start : .stop

        return showParking(with: state)
    }

    static func showParking(with state: Parking.State) -> Bool {

        log("Opened with parking state '\(state.rawValue)'")
        return true
    }
}
