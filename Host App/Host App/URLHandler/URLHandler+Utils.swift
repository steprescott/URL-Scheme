//
//  URLHandler+Utils.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

let logNotificationName = Notification.Name("log-notification")

extension URLHandler {
    static func log(_ message: String) {
        NotificationCenter.default.post(name: logNotificationName,
                                        object: nil,
                                        userInfo: ["message" : message])
    }
}
