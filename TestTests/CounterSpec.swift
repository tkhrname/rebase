//
//  CounterSpec.swift
//  Test
//
//  Created by 渡邊 丈洋 on 2020/12/14.
//  
//

import Quick
import Nimble

class CounterSpec: QuickSpec {
    override func spec() {
        // 初期値と期待結果が異なる以外は同じ処理をしている。どちらも同じ振る舞いをしている。
        describe("#increment") {
            var counter: Counter!

            beforeEach {
                counter = Counter()
            }

            context("初期値が0") {
                it("2回呼び出したら+2されること") {
                    counter.reset()
                    counter.increment()
                    counter.increment()
                    XCTAssertEqual(counter.count, 2)
                }
            }

            context("初期値が1") {
                it("2回呼び出したら+2されること") {
                    counter.reset(1)
                    counter.increment()
                    counter.increment()
                    XCTAssertEqual(counter.count, 3)
                }
            }
        }
    }
}
/// 同じ振る舞いのテストを共通化する
// 共通の期待する振る舞いとしてBehavior<Context>を継承したクラスを定義
// 初期値(Int)を私て振る舞い(incrementを2回実行する)をすると期待値(初期値+2になる)
class CountableBehavior: Behavior<Int> {

    override class func spec(_ aContext: @escaping () -> Int) {
        var counter: Counter!
        var initial: Int! // 初期値

        beforeEach {
            initial = aContext() // 初期値をaContextから取得する
            counter = Counter()
            counter.reset(initial)
            counter.increment()
            counter.increment()
        }

        it("incrementを2回呼び出したら、現在の値+2されること") {
            XCTAssertEqual(counter.count, initial + 2)
        }
    }
}

class CountebleBehaviorSpec: QuickSpec {
    override func spec() {
        describe("Counter") {
            itBehavesLike(CountableBehavior.self) { 0 }
            itBehavesLike(CountableBehavior.self) { 1 }
        }
    }
}
