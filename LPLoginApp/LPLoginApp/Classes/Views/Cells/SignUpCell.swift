//
//  SignUpCell.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 04/05/21.
//

import SwiftUI


struct SignUpCell: View {

    private let signUp: SignUpField
    @State var value: String = ""

    init(signUp: SignUpField) {
        self.signUp = signUp
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(signUp.title)
                .font(.custom(Constants.AppFont.PrimaryFont, size: 16))
                .foregroundColor(.primaryTextColor)
                .padding([.leading, .trailing], 8)


            if signUp.title == "비밀번호" || signUp.title == "비밀번호 확인" {
                PasswordTextField()
            } else {

                TextField(signUp.placeHolder, text: $value)
                    .font(.custom(Constants.AppFont.SecondaryFont, size: 14))
                    .padding(.top, 10)
                    .padding([.leading, .trailing], 8)
                    .keyboardType(getKeyboardType())
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }

            Divider()
                .frame(height: 1)
                .background(Color.signupSepartorColor)
                .padding(.top, 14)

        }
        .frame(height: 87)

    }
    
    private func getKeyboardType() -> UIKeyboardType {
    
        var keyboardType: UIKeyboardType = .default

            switch signUp.title {
            case "휴대폰 번호":
                keyboardType = .phonePad
            case "Email":
                keyboardType = .emailAddress

            case "생년월일":
                keyboardType = .numbersAndPunctuation

            default:
                keyboardType = .default
            
    }
        return keyboardType
    }
    
    private func PasswordTextField() -> some View {
        return
            SecureField(signUp.placeHolder, text: $value)
            .disableAutocorrection(true)
            .font(.custom(Constants.AppFont.SecondaryFont, size: 14))
            .padding(.top, 10)
            .padding([.leading, .trailing], 8)
    }
}



struct SignUpCell_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCell.init(signUp: SignUpField.init(title: "Title", placeHolder: "Placeholder"))
    }
}
