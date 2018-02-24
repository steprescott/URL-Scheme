//
//  URLHandler+Message.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

extension URLHandler {
    static func showMessage(with queryItems: [URLQueryItem] = []) throws -> Bool {

        guard
            let item = queryItems.itemWithkey("string"),
            let message = item.value
            else { throw URLHandler.Error.missingQueryParameter }

        log("Opened with message `\(message)`")

        return true
    }
}
