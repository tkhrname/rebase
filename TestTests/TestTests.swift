//
//  TestTests.swift
//  TestTests
//
//  Created by 渡邊 丈洋 on 2020/12/07.
//

import XCTest
@testable import Test

extension String {
    func isOnlyNumeric() -> Bool {
        return self.trimmingCharacters(in: .decimalDigits).count <= 0
    }
}

func assertOnlyNumeric(string: String, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(string.isOnlyNumeric(), "", file: file, line: line)
}

func asyncString(completion: ((String) -> ())?) {
    DispatchQueue.global().async {
        sleep(3)
        completion?("文字列")
    }
}

enum OperationError: Error {
    case divisionByZero
}

func divide(x: Int, y: Int) throws -> Int {
    if x == 0 || y == 0 {
        throw OperationError.divisionByZero
    }
    return x / y
}


class TestTests: XCTestCase {

    /**
     * @method +setUp
     * Suite-level setup method called before the class begins to run any of its test methods or their associated per-instance setUp methods.
     *
     */
    override class func setUp() {
        // 全体的な初期化
        // 最初のテストメソッドが実行される前に呼び出される
        super.setUp()
        print("$ override class func setUp()") // 1
    }

    /*!
     * @method -setUp
     * Setup method called before the invocation of each test method in the class.
     */
    override func setUp() {
        // 各メソッドが実行される前に呼び出される
        // 各テストメソッドの初期化
        super.setUp()
        print("$ override func setUp()") // 3, 7, 12
    }

    /*!
     * @method +tearDown
     * Suite-level teardown method called after the class has finished running all of its test methods and their associated per-instance tearDown methods and teardown blocks.
     * このテストクラスが破棄される直前に実行される
     * 全体的な後処理
     */
    override class func tearDown() {
        //
        super.tearDown()
        print("$ override class func tearDown()") // 16
    }

    /*!
     * @method -tearDown
     * Teardown method called after the invocation of each test method in the class.
     * 各テストメソッドが実行された後に呼び出される
     */
    override func tearDown() {
        //
        super.tearDown()
        print("$ override func tearDown()") // 4, 9, 14
    }

    /*!
     * @method -setUpWithError:
     * This method is called before invoking `setUp` and the test method.
     * ここにセットアップコードを入力します。このメソッドは、クラス内の各テストメソッドを呼び出す前に呼び出されます。
     */
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("$ override func setUpWithError() throws") // 2, 6, 11
    }

    /*!
     * @method -tearDownWithError:
     * This method is called after invoking the test method (if applicable) and `tearDown`.
     * このメソッドはテストメソッドとtearDownメソッドの呼び出し後に実行される
     * ここに分解コードを入れてください。このメソッドは、クラス内の各テストメソッドの呼び出し後に呼び出されます。
    */
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("$ override func tearDownWithError() throws") // 5, 10, 15
    }

    func test数字が2文字含まれており_合計7文字入力された場合にfalseが返されること() {
        print("$ テストメソッド") // 13
        XCTAssertFalse(Def.validate(password: "abcde12"))
    }

    func test割り算の計算() {
        print("$ テストメソッド") // 8
        XCTAssertEqual(Def.divide(4, by: 2), 2, "Error!!!!")
    }

    func testAsyncString() {
        // 非同期処理の待機と完了を表現するためのインスタンス
        // descriptionは任意のもので
        let exp = XCTestExpectation(description: "Async String")
        // 非同期処理の関数呼び出し
        asyncString { string in
            XCTAssertEqual(string, "文字列")
            exp.fulfill()
        }
        // 待機を行うXCTestExpectation
        // timeoutで指定した5秒以内にexpのfulfillが呼び出されない場合テスト失敗
        wait(for: [exp], timeout: 5.0)
    }

    func testDivideWehnDivisionByZero() {
        XCTAssertThrowsError(try divide(x: 0, y: 2)) { error in
            if let error = error as? OperationError {
                XCTAssertEqual(error, OperationError.divisionByZero)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
