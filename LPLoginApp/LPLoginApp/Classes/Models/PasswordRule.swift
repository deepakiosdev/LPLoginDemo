//
//  PasswordRule.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 05/05/21.
//

import Foundation

struct PasswordRule: Identifiable {
    let id = UUID()
    let name: String
    let isSatisfied: Bool
}



extension PasswordRule {
    
    static func all() -> [PasswordRule] {
        return[
            PasswordRule.init(name: "최소 8자 이상", isSatisfied: true),
            PasswordRule.init(name: "최소 하나의 대문자", isSatisfied: false),
            PasswordRule.init(name: "최소 하나의 숫자", isSatisfied: false),
            PasswordRule.init(name: "하나의 특수문자", isSatisfied: false)
        ]
    }
}
