//
//  URLHandler+Routes.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

enum URLHandler {

    // This should match the setting in the Info.plist
    public static let scheme = "hostapp"

    // Optional check to only open from known sources
    public static let knownSources = [ "app.demo.client-app" ]

    // Add new paths you want to support
    enum Route: String {
        case color
        case message
        case park
        case startParking = "park/start"
        case stopParking = "park/stop"
    }

    // Call the correct function for the path
    static func open(_ path: Route, with queryItems: [URLQueryItem]? = nil) throws -> Bool {
        let items = queryItems ?? []

        switch path {
            case .color: return showColor(with: items)
            case .message: return try showMessage(with: items)
            case .park: return showParking(with: items)
            case .startParking: return showParking(with: .start)
            case .stopParking: return showParking(with: .stop)
        }
    }
}
