//
//  Sequence.swift
//  Host App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == URLQueryItem {
    func itemWithkey(_ key: String) -> URLQueryItem? {
        return first(where: { $0.name == key })
    }
}
