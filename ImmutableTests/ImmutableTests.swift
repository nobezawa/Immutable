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

}
