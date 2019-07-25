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

    public static func prepend<A>(_ lhs: A, _ rhs: [A]) -> [A] {
        return [lhs] + rhs
    }

    public static func prepend<A>(_ lhs: A) -> (_ with: [A]) -> [A] {
        return curry(prepend)(lhs)
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

    public static func drop<A>(_ index: Int, _ elements: [A]) -> [A] {
        if elements.isEmpty || index == 0 { return [] }
        var copyElements = elements
        copyElements.remove(at: (index - 1))
        return copyElements
    }

    public static func drop<A>(_ index: Int) -> (_ elements: [A]) -> [A] {
        return curry(drop)(index)
    }

    public static func filter<A>(_ function: (A) -> Bool, _ elements: [A]) -> [A] {
        return elements.filter{ function($0) }
    }

    public static func filter<A>(_ function: @escaping (A) -> Bool) -> (_ elements: [A]) -> [A] {
        return curry(filter)(function)
    }

    public static func all<A>(_ function: @escaping (A) -> Bool, _ elements: [A]) -> Bool {
        return elements.allSatisfy(function)
    }

    public static func all<A>(_ function: @escaping (A) -> Bool) -> (_ elements: [A]) -> Bool {
        return curry(all)(function)
    }

    public static func find<A>(_ function: @escaping (A) -> Bool, _ elements: [A]) -> A? {
        return elements.first(where: { function($0) } )
    }

    public static func find<A>(_ function: @escaping (A) -> Bool) ->  (_ elements: [A]) -> A? {
        return curry(find)(function)
    }

    public static func concat<A>(_ elements: [A]...) -> [A] {
        var result: [A] = []
        for list in elements {
            result = result + list
        }
        return result
    }
}
