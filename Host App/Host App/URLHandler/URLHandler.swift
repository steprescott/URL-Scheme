//
//  URLHandler.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import UIKit

extension URLHandler {
    public enum Error: String, Swift.Error, CustomStringConvertible {
        case malformedURL
        case unknownSource
        case unsupportedPath
        case missingQueryParameter

        var description: String {
            switch self {
            case .malformedURL: return "URL is malformed"
            case .unknownSource: return "App opened from an unknown source"
            case .unsupportedPath: return "Unsupported path"
            case .missingQueryParameter: return "URL does not contain required query parameter"
            }
        }
    }

    public static func handel(_ url: URL, with options: [UIApplicationOpenURLOptionsKey : Any] = [:], approved: Bool = false) throws -> Bool {

        // Perform check if the url isn't approved
        if !approved {
            // Validate that the request came from a known source
            if let sourceApplication = options[.sourceApplication] as? String {
                guard knownSources.contains(sourceApplication)
                    else { throw Error.unknownSource }
            }
        }

        // Get the components from the URL
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            else { throw Error.malformedURL }

        var route = components.path

        if route.hasPrefix("/") {
            route.remove(at: route.startIndex)
        }

        // Get the route from the path
        guard let path = Route(rawValue: route)
            else { throw Error.unsupportedPath }

        // Process the URL request
        return try open(path, with: components.queryItems)
    }
}
