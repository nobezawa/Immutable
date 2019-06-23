//
// Created by 延澤拓郎 on 2019-06-23.
// Copyright (c) 2019 延澤拓郎. All rights reserved.
//

import Foundation


open class I {

    public static func add<T: BasicIntType>(_ lhs: T, _ rhs: T) -> T {
        return lhs + rhs
    }

    public static func add<T: BasicIntType>(_ lhs: T) -> (_ to: T) -> T {
        return curry(add)(lhs)
    }

    public static func equals<T: Equatable>(_ lhs: T, _ rhs: T) -> Bool {
        return lhs == rhs
    }

    public static func equals<T: Equatable>(_ lhs: T) -> (_ to: T) -> Bool {
        return curry(equals)(lhs)
    }
}
