//
// Created by nobezawa on 2019-06-23.
// Copyright (c) 2019 延澤拓郎. All rights reserved.
//

import Foundation

extension I {

    public static func map<A, B>(_ function: (A) -> B, _ functor: [A]) -> [B] {
        return functor.map(function)
    }

    public static func map<A, B>(_ function: @escaping (A) -> B) -> (_ with: [A]) -> [B] {
        return curry(map)(function)
    }

    public static func append<A>(_ lhs: A, _ rhs: [A]) -> [A] {
        return rhs + [lhs]
    }

    public static func append<A>(_ lhs: A) -> (_ with: [A]) -> [A] {
        return curry(append)(lhs)
    }

    public static func first<A>(_ elements: [A]) -> Optional<A> {
        return elements.first
    }

    public static func last<A>(_ elements: [A]) -> Optional<A> {
        return elements.last
    }

    public static func take<A>(_ xtake: Int, _ elements: [A]) -> ArraySlice<A> {
        if elements.isEmpty || xtake == 0 { return [] }
        return elements.prefix(xtake)
    }

    public static func take<A>(_ xtake: Int) -> (_ elements: [A]) -> ArraySlice<A> {
        return curry(take)(xtake)
    }

    public static func filter<A>(_ function: (A) -> Bool, _ elements: [A]) -> [A] {
        return elements.filter{ function($0) }
    }

    public static func filter<A>(_ function: @escaping (A) -> Bool) -> (_ elements: [A]) -> [A] {
        return curry(filter)(function)
    }
}
