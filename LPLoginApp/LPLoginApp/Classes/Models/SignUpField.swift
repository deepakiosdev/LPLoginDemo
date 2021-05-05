//
//  SignUpField.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 05/05/21.
//

import Foundation

struct SignUpField: Identifiable {
    let id = UUID()
    let title: String
    let placeHolder: String
}


extension SignUpField {
    
    static func all() -> [SignUpField] {
        return [
            SignUpField.init(title: "이름", placeHolder: "이채민"),
            SignUpField.init(title: "휴대폰 번호", placeHolder: "+82 111 1111111"),
            SignUpField.init(title: "생년월일", placeHolder: "mm - dd-yyyy"),
            SignUpField.init(title: "Email", placeHolder: "john.doe@alphametics.com"),
            SignUpField.init(title: "비밀번호", placeHolder: ""),
            SignUpField.init(title: "비밀번호 확인", placeHolder: "")
        ]
    }
}
