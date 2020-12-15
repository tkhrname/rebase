//
//  Def.swift
//  Test
//
//  Created by 渡邊 丈洋 on 2020/12/07.
//

import Foundation

struct Def {
    static func validate(password: String) -> Bool {
        if password.count <= 7 {
            return false
        }

        let numstring = password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return 2 <= numstring.count
    }

    static func divide(_ a: Int, by b: Int) -> Int {
        return a / b
    }

}
