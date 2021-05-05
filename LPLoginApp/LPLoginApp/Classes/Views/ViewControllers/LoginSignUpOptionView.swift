//
//  LoginSignUpOptionView.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 04/05/21.
//

import SwiftUI

struct LoginSignUpOptionView: View {
    
    var body: some View {
        NavigationView {
            VStack() {
                
                Image.init(Constants.Images.Logo)
                
                Image.init(Constants.Images.Finance)
                    .padding(.top, 80)
                
                Text(Constants.Strings.StayOnTopText)
                    .font(.custom(Constants.AppFont.HeadingFont, size: Constants.AppFontSize.Heading))
                    .foregroundColor(.primaryTextColor)
                    .padding(.top, 40)
                
                Text(Constants.Strings.LoginOptionDescriptionText)
                    .font(.custom(Constants.AppFont.HeadingFont, size: 14))
                    .foregroundColor(.secondaryTextColor)
                    .padding(.top, 40)
                    .padding([.leading, .trailing], 16)

                Spacer()
                
                SignUpButton()
                LoginButton()
                    .padding(.bottom, 80)
                
            }
            .offset(y: 50)
        }
    }
    
}


extension LoginSignUpOptionView {
    
    func SignUpButton() -> some View {
        return NavigationLink(destination: SignUpView()) {
            Text(Constants.Strings.SignUp)
                .font(.custom(Constants.AppFont.PrimaryFont, size: 16))
                .foregroundColor(.primaryButtonTextColor)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 53)
                .background(Color.primaryButtonColor)
                .cornerRadius(6)
                .shadow(color: .white, radius: 4, x: 0, y: 2)
                .padding([.leading, .trailing], 64)

        }
    }
    
    func LoginButton() -> some View {
        return NavigationLink(destination: LogInView()) {
            
            Text(Constants.Strings.Login)
                .font(.custom(Constants.AppFont.PrimaryFont, size: 16))
                .foregroundColor(.primaryButtonColor)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 53)
        }
    }
}

struct LoginSignUpOptionView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignUpOptionView()
    }
}

