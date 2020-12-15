//
//  StubTest.swift
//  TestTests
//
//  Created by 渡邊 丈洋 on 2020/12/08.
//

import XCTest

protocol AuthManagerProtocol {
    var isLoggedIn: Bool { get }
}

class StubAuthManager: AuthManagerProtocol {
    var isLoggedIn: Bool = false
}

class DialogManager {
    private let authManager: AuthManagerProtocol
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }

    var shouldShowLoginDialog: Bool {
        return !self.authManager.isLoggedIn
    }
}


class StubTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testShowLoginDialog_ログイン済み() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = true // セッターインジェクション
        let dialogManager = DialogManager(authManager: stubAuthManager)
        XCTAssertFalse(dialogManager.shouldShowLoginDialog)
    }

    func testShowLoginDialog_未ログイン() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = false // セッターインジェクション
        let dialogManager = DialogManager(authManager: stubAuthManager)
        XCTAssertTrue(dialogManager.shouldShowLoginDialog)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
