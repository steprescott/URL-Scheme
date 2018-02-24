//
//  URLHandler+Color.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

extension URLHandler {
    static func showColor(with queryItems: [URLQueryItem] = []) -> Bool {
        var color = "yellow"

        if  let item = queryItems.itemWithkey("value"),
            let string = item.value {
            color = string
        }

        log("Opened with color `\(color)`")

        return true
    }
}
