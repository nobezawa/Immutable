//
// Created by 延澤拓郎 on 2019-06-23.
// Copyright (c) 2019 延澤拓郎. All rights reserved.
//

import Foundation

extension I {

    public static func curry<A, B, C>(_ function: @escaping (A, B) -> C) -> (A) -> (B) -> C {
        return { first in
            return { second in
                return function(first, second)
            }
        }
    }
}
