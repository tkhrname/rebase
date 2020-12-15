//
//  QuickTest.swift
//  TestTests
//
//  Created by 渡邊 丈洋 on 2020/12/10.
//

//import XCTest
import Quick

class QuickTest: QuickSpec {
    override func spec() {
        // 概要
        describe("String#isEmpty") {
            // 条件1
            context("When an empty string is given") {
                // 期待する結果
                it("returns true") {
                    XCTAssertTrue("".isEmpty)
                }
            }
            // 条件2
            context("when string is blank") {
                it("returns false") {
                    XCTAssertFalse(" ".isEmpty)
                }
            }
        }
    }
}
