//
//  MockTest.swift
//  TestTests
//
//  Created by 渡邊 丈洋 on 2020/12/08.
//

import XCTest

protocol MockLoggerProtocol {
    // 実装すべき機能
    func sendLog(message: String)
}

// モックオブジェクト
class MockLogger: MockLoggerProtocol {

    var invokedSendLog = false
    var invokedSendLogCount = 0
    var sendLogProperties: [String] = []

    func sendLog(message: String) {
        self.invokedSendLog = true
        self.invokedSendLogCount += 1
        self.sendLogProperties.append(message)
    }
}

class MockCalculator {
    private let logger: MockLoggerProtocol
    init(logger: MockLoggerProtocol) {
        self.logger = logger
    }

    private enum CalcAction {
        case add(Int)
        // TODO: 引き算、割り算なども追加されそう
    }

    private var calcActions: [CalcAction] = []

    func add(num: Int) {
        self.calcActions.append(.add(num))
    }

    func calc() -> Int {
        self.logger.sendLog(message: "START")
        var total = 0
        calcActions.forEach { calcAction in
            switch calcAction {
            case .add(let num):
                self.logger.sendLog(message: "Add")
                total += num
            }

        }
        self.logger.sendLog(message: "Finish")
        return total
    }


}

class MockTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testAdd() {
        let mockLogger = MockLogger()
        let calculator = MockCalculator(logger: mockLogger)
        let expectedSendMessages = [
            "START",
            "Add",
            "Finish"
        ]

        calculator.add(num: 1)

        XCTAssertEqual(calculator.calc(), 1) // calc()の結果判定
        XCTAssertTrue(mockLogger.invokedSendLog) // 処理を実行したか判定
        XCTAssertEqual(mockLogger.invokedSendLogCount, 3) // 何回実行したか判定
        XCTAssertEqual(mockLogger.sendLogProperties, expectedSendMessages)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
