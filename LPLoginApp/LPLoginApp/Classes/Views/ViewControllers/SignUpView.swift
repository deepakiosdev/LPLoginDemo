//
//  SignUpView.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 04/05/21.
//

import SwiftUI

struct SignUpView: View {
    
    let signUpFields = SignUpField.all()
    let passwordRules = PasswordRule.all()
    
    var body: some View {
        
        VStack() {
            
            Image.init(Constants.Images.Logo)
            
            Text(Constants.Strings.SignUpTitle)
                .font(.custom(Constants.AppFont.PrimaryFont, size: Constants.AppFontSize.Heading))
                .foregroundColor(.darkTextColor)
                .padding(.top, 34)
            
            ScrollView {
                LazyVStack {
                    ForEach(self.signUpFields) {signup in
                        SignUpCell.init(signUp: signup)
                    }
                }
                .padding([.leading, .trailing], 16)

                
                PasswordRuleView()
                
                TermsAndConditionButtonView()
                    .padding(.top, 70)
                
                SignUpButton()
                    .padding(.top, 34)

                AlreadyHaveAccountButtonView()
                    .padding(.top, 25)
                    .padding(.bottom, 50)

            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 60)
            
        }
        .navigationBarBackButtonHidden(true)
    }
    

}

//MARK: Views
extension SignUpView {
    
    private func PasswordRuleView() -> some View {
        return LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 250, maximum: 400)), count: 2), alignment: .leading) {
            
            ForEach(self.passwordRules, content: PasswordRuleCell.init(rule: ))
        }
        .padding(.top, 34)
        .padding(.leading, 20)
        
    }
    
    
    private func TermsAndConditionButtonView() -> some View {
        return
            Button(action: {
                print("Terms And Condition Button action")
            }) {
                HStack() {
                    Image(Constants.Images.CheckBox)
                        .padding(.trailing, 4)
                    Text(Constants.Strings.AgreeTermsAndCondition)
                        .font(.custom(Constants.AppFont.PrimaryFont, size: 12))
                        .foregroundColor(.secondaryTextColor)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 53)
        
    }
    
    
    private func AlreadyHaveAccountButtonView() -> some View {
        return NavigationLink(destination: LogInView()) {
            
            HStack() {
                
                Text(Constants.Strings.AlreadyHaveAccount)
                    .font(.custom(Constants.AppFont.PrimaryFont, size: 14))
                    .foregroundColor(.secondaryTextColor)
                Rectangle().fill(Color.primaryButtonColor).frame(width: 41, height: 1, alignment: .trailing)
                    .padding(.top, 18)
                    .offset(x:-41)
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40)
            
        }
    }

    private func SignUpButton() -> some View {
        return NavigationLink(destination: LogInView()) {
            Text(Constants.Strings.SignUp)
                .font(.custom(Constants.AppFont.PrimaryFont, size: 16))
                .foregroundColor(.primaryButtonTextColor)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 53)
                .background(Color.primaryButtonColor)
                .cornerRadius(6)
                .shadow(color: .white, radius: 4, x: 0, y: 2)
                .padding([.leading, .trailing], 64)

        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
