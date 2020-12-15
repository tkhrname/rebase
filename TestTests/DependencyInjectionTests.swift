//
//  DependencyInjectionTests.swift
//  TestTests
//
//  Created by 渡邊 丈洋 on 2020/12/08.
//
import XCTest


protocol LoggerProtocol {
    func sendLog(message: String)
}

class Logger: LoggerProtocol {
    func sendLog(message: String) {
        // 本番用のログ送信の実装
    }
}

class DebugLogger: LoggerProtocol {
    func sendLog(message: String) {
        // デバッグ用のログ送信の実装
    }
}

class Calculator {
    // LoggerProtocolに準拠したコンポーネントと置き換え可能な型
    private let logger: LoggerProtocol

    init(logger: LoggerProtocol) {
        self.logger = logger
    }
}

class DependencyInjectionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }




    func testPerformanceExample() throws {
        self.measure {}
    }

}
