//
//  TimeInterval+DispatchTimeInterval.swift
//  
//  Created by Julien SAGOT on 13/11/2020.
//  Copyright © 2020 Julien Sagot. All rights reserved.
//

import Foundation

extension TimeInterval {

    init(dispatchTimeInterval: DispatchTimeInterval) {
        switch dispatchTimeInterval {
        case .seconds(let value):
            self = Double(value)
        case .milliseconds(let value):
            self = Double(value) / 1_000
        case .microseconds(let value):
            self = Double(value) / 1_000_000
        case .nanoseconds(let value):
            self = Double(value) / 1_000_000_000
        case .never:
            self = 0
        @unknown default:
            self = 0
        }
    }

    var nanoseconds: DispatchTimeInterval {
        return DispatchTimeInterval.nanoseconds(Int(self * 1_000_000_000))
    }
}
