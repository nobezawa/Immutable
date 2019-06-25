//
// Created by 延澤拓郎 on 2019-06-23.
// Copyright (c) 2019 延澤拓郎. All rights reserved.
//

import Foundation


open class I {

    public static func apply<A, B>(_ function: @escaping (A) -> B, argument: A) -> B {
        return function(argument)
    }

    public static func apply<A, B>(_ function: @escaping (A) -> B) -> (A) -> B {
        return curry(apply)(function)
    }

    public static func apply<A, B>(_ functions: [(A) -> B], _ argument: A) -> [B] {
        return functions.map { function in function(argument) }
    }

    public static func apply<A, B>(_ functions: [(A) -> B]) -> (A) -> [B] {
        return curry(apply)(functions)
    }

    public static func bind<A, B, C>(_ lhs: @escaping (A) -> B, _ rhs: @escaping (B) -> C) -> (A) -> C {
        return { rhs(lhs($0)) }
    }

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

precedencegroup I { associativity: left }
infix operator >>>: I
public func >>> <A, B, C>(_ lhs: @escaping (A) -> B,
                   _ rhs: @escaping (B) -> C) -> (A) -> C {
    return { rhs(lhs($0)) }
}
