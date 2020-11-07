//
//  LoginEntry.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct LoginEntry: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error: String = ""
    @EnvironmentObject var userSession: UserSession
    
    func signIn () {
        userSession.signIn(email: email, password: password)
        { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                LoginText()
                Spacer()
                Group {
                    EmailTextField(email: $email)
                    textFieldLabeled (width: Constants.frameWidth, description: "EMAIL")
                    SecureField("", text: $password)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(width: Constants.frameWidth*0.8, height: 30)
                        .padding(.leading)
                        .offset(x: -30, y:10)
                    textFieldLabeled (width: Constants.frameWidth, description: "PASSWORD")
                }
                ForgotPasswordNavLink()
                Spacer()
                if (error != "") {
                    Text(error)
                        .foregroundColor(Color.red)
                }
                Spacer()
                Button (action: signIn) {
                    ArrowButtonView()
                }.padding(.bottom, Constants.verticalPadding)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEntry()
    }
}


struct LoginText: View {
    var body: some View {
        Text("Login")
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding(.top, Constants.verticalPadding)
    }
}

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField("", text: $email)
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth*0.8, height: 30)
            .padding(.leading)
            .offset(x: -30, y:10)
    }
}

struct ForgotPasswordNavLink: View {
    var body: some View {
        NavigationLink(destination: ForgotPasswordView()) {
            Text("Forgot password?")
                .frame(width: Constants.frameWidth, height: 50)
                .foregroundColor(Color.white)
                .cornerRadius(30)
                .font(.footnote)
        }
    }
}

struct ArrowButtonView: View {
    var body: some View {
        Image("WhiteArrow").renderingMode(.original)
            .resizable()
            .frame(width: 60, height: 60)
    }
}
