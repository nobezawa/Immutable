//
//  ImmutableTests.swift
//  ImmutableTests
//
//  Created by 延澤拓郎 on 2019/06/23.
//  Copyright © 2019 延澤拓郎. All rights reserved.
//

import XCTest
@testable import Immutable

class ImmutableTests: XCTestCase {

    func testAdd() {
        let one = 1
        let two = 2

        XCTAssertEqual(I.add(one, two), 3)
        XCTAssertEqual(I.add(one)(two), 3)
    }

    func testEquals() {
        let str1 = "1"
        let str2 = "2"

        XCTAssertTrue(I.equals(str1, str1))
        XCTAssertFalse(I.equals(str1, str2))

        XCTAssertTrue(I.equals(str1)(str1))
        XCTAssertFalse(I.equals(str1)(str2))
    }

    func testMap() {
        let add = I.add(1)

        XCTAssertEqual(I.map(add, [1, 2]), [2, 3])
        XCTAssertEqual(I.map(add)([1, 2]), [2, 3])
    }

    func testAppend() {

        XCTAssertEqual(I.append(1, [2]), [2, 1])
        XCTAssertEqual(I.append("Bar", ["Foo"]), ["Foo", "Bar"])

        XCTAssertEqual(I.append(1)([2]), [2, 1])
        XCTAssertEqual(I.append("Bar")(["Foo"]), ["Foo", "Bar"])
    }

    func testFirst() {
        let list = [1, 2, 3]

        let first = I.first(list)
        first.flatMap { element in
            XCTAssertEqual(element, 1)
        }

        let emptyList: Array<Int> = []
        let emptyLast = I.first(emptyList)
        XCTAssertNil(emptyLast)
    }

    func testLast() {
        let list = [1, 2, 3]

        let last = I.last(list)
        last.flatMap { element in
            XCTAssertEqual(element, 3)
        }

        let emptyList: Array<Int> = []
        let emptyLast = I.last(emptyList)
        XCTAssertNil(emptyLast)
    }

    func testTake() {
        let list = [1, 2, 3]
        XCTAssertEqual(I.take(1, list), [1])
        XCTAssertEqual(I.take(2, list), [1, 2])
        XCTAssertEqual(I.take(4, list), [1, 2, 3])

        XCTAssertEqual(I.take(1)(list), [1])
    }

    func testFilter() {
        let isEven: (Int) -> Bool = { (n: Int) in n % 2 == 0 }

        XCTAssertEqual(I.filter(isEven, [1, 2, 3]), [2])
        XCTAssertEqual(I.filter(isEven)([1, 2, 3]), [2])
    }

}
