//
//  LogInView.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 04/05/21.
//

import SwiftUI

struct LogInView: View {

    private let usernameInDB = "test@luxpmsoft.com"
    private let passwordInDB = "test1234!"
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showDashboard = false
    @State var showsAlert = false

    var body: some View {
        
        VStack() {
            
            Image.init(Constants.Images.Logo)
            
            Text(Constants.Strings.Login)
                .font(.custom(Constants.AppFont.PrimaryFont, size: Constants.AppFontSize.Heading))
                .foregroundColor(.darkTextColor)
                .padding(.top, 34)
            
            ScrollView {
                    EmailTextFieldView()

                    PasswordTextFieldView()

                    ForgotPasswordButton()
                        .padding(.top, 48)
                     
                LoginButton()
                    .padding(.top, 50)

                DoNotHaveAccountButton()
                    .padding(.top, 25)
                    .padding(.bottom, 50)
            }
            .padding([.leading, .trailing], 32)
            .padding(.top, 60)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: Views
extension LogInView {
    
    private func EmailTextFieldView() -> some View {
        return
            VStack(alignment: .leading) {
                
                Text("Email")
                    .font(.custom(Constants.AppFont.PrimaryFont, size: 12))
                    .foregroundColor(.primaryTextColor)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                
                HStack() {
                    Image.init(Constants.Images.EmailIcon)
                    TextField("sabahat@gmail.com", text: $username)
                        .font(.custom(Constants.AppFont.SecondaryFont, size: 16))
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 8)
                
                Divider()
                    .frame(height: 1)
                    .background(Color.loginSepartorColor)
                    .padding(.top, 14)
                
            }
            .frame(height: 87)
            .padding([.leading, .trailing], 16)

        
    }
    
    private func PasswordTextFieldView() -> some View {
        return
            VStack(alignment: .leading) {
                
                Text("비밀번호")
                    .font(.custom(Constants.AppFont.PrimaryFont, size: 12))
                    .foregroundColor(.primaryTextColor)
                    .padding([.leading, .trailing], 8)

                HStack() {
                    Image.init(Constants.Images.LockIcon)
                    SecureField("", text: $password)
                        .font(.custom(Constants.AppFont.SecondaryFont, size: 16))
                        .disableAutocorrection(true)
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 8)

                Divider()
                    .frame(height: 1)
                    .background(Color.loginSepartorColor)
                    .padding(.top, 14)
                
            }
            .frame(height: 87)
            .padding([.leading, .trailing], 16)

        
    }
    
    
    private func ForgotPasswordButton() -> some View {
        
        return
            HStack {
                Spacer()
                Button(Constants.Strings.ForgotPassword) {
                    print("Forgot password button action")
                }
                .font(.custom(Constants.AppFont.PrimaryFont, size: 12))
                .foregroundColor(.secondaryTextColor)
            }
           
    }


    private func LoginButton() -> some View {
        return
            NavigationLink(destination:  HomeView(), isActive: $showDashboard) {
                Button(action: {
                    if (username == usernameInDB && password == passwordInDB) {
                        self.showDashboard = true
                    } else {
                        self.showsAlert = true
                    }
                }) {
                    Text(Constants.Strings.Login)
                        .font(.custom(Constants.AppFont.PrimaryFont, size: 16))
                        .foregroundColor(.primaryButtonTextColor)
                        .padding()
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 53)
                        
                }
                .background(Color.primaryButtonColor)
                .cornerRadius(6)
                .shadow(color: .white, radius: 4, x: 0, y: 2)
                .padding([.leading, .trailing], 64)
                .alert(isPresented: self.$showsAlert) {
                    Alert(title: Text("Invalid Credential"),
                          message: Text("Please check username and password") )
                }

            }
                    
    }
    
    
    private func DoNotHaveAccountButton() -> some View {
        return NavigationLink(destination: SignUpView()) {
            
            HStack() {
                Text(Constants.Strings.DoNotHaveAccount)
                    .font(.custom(Constants.AppFont.PrimaryFont, size: 14))
                    .foregroundColor(.secondaryTextColor)
                Rectangle().fill(Color.primaryButtonColor).frame(width: 41, height: 1, alignment: .trailing)
                    .padding(.top, 18)
                    .offset(x:-41)
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40)
            
        }
    }
    
}
    
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
