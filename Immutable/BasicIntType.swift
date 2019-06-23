//
// Created by 延澤拓郎 on 2019-06-23.
// Copyright (c) 2019 延澤拓郎. All rights reserved.
//

import Foundation

public protocol BasicIntType {
    static func + (lhs: Self, rhs: Self) -> Self

    //static func == (lhs: Self, rhs: Self) -> Self
}

extension Int: BasicIntType {
}

extension Int8: BasicIntType {
}

extension Int16: BasicIntType {
}

extension Int32: BasicIntType {
}

extension Int64: BasicIntType {
}
