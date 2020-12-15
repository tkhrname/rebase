//
//  Template.swift
//  Test
//
//  Created by 渡邊 丈洋 on 2020/12/11.
//  
//

import Quick
import Nimble

struct Counter {
    var count: Int = 0
    mutating func increment() {
        count += 1
    }
    mutating func reset(_ value: Int = 0) {
        count = value
    }
}

class Template: QuickSpec {
    override func spec() {
        beforeSuite {
            print("# beforeSuite")
        }
        afterSuite {
            print("# afterSuite")
        }
        beforeEach {
            print("# beforeEach-0")
        }
        
        describe("Counter") {
            var counter: Counter!

            beforeEach {
                counter = Counter()
                print("# beforeEach")
            }

            it("初期値は0であること") {
                print("# 初期値は0であること")
                XCTAssertEqual(counter.count, 0)
            }

            describe("#increment") {
                context("1回だけ呼び出し") {
                    it("countが1になること") {
                        print("# countが1になること")
                        counter.increment()
                        XCTAssertEqual(counter.count, 1)
                    }
                }
                context("2回だけ呼び出し") {
                    it("countが2になること") {
                        print("# countが2になること")
                        counter.increment()
                        counter.increment()
                        XCTAssertEqual(counter.count, 2)
                    }
                }
            }

            afterEach {
                counter.reset()
                print("# afterEach")
            }
        }
    }
}
