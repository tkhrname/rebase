//
//  NimbleSample.swift
//  Test
//
//  Created by 渡邊 丈洋 on 2020/12/14.
//  
//

import Quick
import Nimble
import XCTest

@testable import Test

class NimbleSample: QuickSpec {
    override func spec() {

    }
}

struct Person: Equatable {
    var name: String
    var age: Int
}

extension Sequence where Element == Person {
    func teens() -> [Person] {
        return self.filter { (13 ..< 19).contains($0.age) }
    }
}

class NimbleTests: XCTestCase {

    let members = [
        Person(name: "Aaa", age: 12),
        Person(name: "Bbb", age: 13),
        Person(name: "Ccc", age: 19),
        Person(name: "Ddd", age: 20)
    ]

    func testWithNimble() {
        let teens = members.teens()
//        expect(teens).to(haveCount(2))
        expect(teens).to(haveCount(1))
//        expect(teens).to(contain(members[1], members[2]))
        expect(teens).to(contain(members[1]))
    }
}
