//
//  TestQuickConfiguration.swift
//  Test
//
//  Created by 渡邊 丈洋 on 2020/12/14.
//  
//

import Quick

class TestQuickConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        // 全てのitの前に毎回呼び出される
        configuration.beforeEach { exampleMetadata in
            print("# configuration.beforeSuite: \(exampleMetadata.exampleIndex)")
        }
        // 全てのitの後に毎回呼び出される
        configuration.afterSuite {
            print("# configuration.afterSuite")
        }
    }
}
