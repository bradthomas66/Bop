//
//  RegisterEmailView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-07.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//
//  TODO: Set errors for email and username on their own screen

import SwiftUI

struct RegisterEmailView: View {
    
    @State private var email: String = ""
    @State private var retypeEmail: String = ""
    @State private var errorDisplayed: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Group {
                    EmailTitleText()
                    Spacer()
                    EmailTextField(email: $email)
                    textFieldLabeled (width: Constants.frameWidth, description: "EMAIL")
                    RetypeEmailTextField(retypeEmail: $retypeEmail)
                    textFieldLabeled (width: Constants.frameWidth, description: "RETYPE EMAIL")
                    Spacer()
                    if email == retypeEmail && email.isEmpty != true {
                        RegisterUsernameNavLink(email: $email)
                    }
                    else {
                        if errorDisplayed {
                            RegisterEmailErrorMessage()
                        }
                        else {
                            Text("")
                                .padding(.bottom, Constants.verticalPadding)
                        }
                        RegisterEmailErrorButton(errorDisplayed: $errorDisplayed)
                    }
                }
            }
        }
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView()
    }
}

struct EmailTitleText: View {
    var body: some View {
        Text("What's your email?")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding(.top, Constants.verticalPadding)
    }
}

struct RetypeEmailTextField: View {
    @Binding var retypeEmail: String
    var body: some View {
        TextField("", text: $retypeEmail)
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth*0.8, height: 30)
            .padding(.leading)
            .offset(x: -30, y:10)
    }
}

struct RegisterUsernameNavLink: View {
    @Binding var email: String
    var body: some View {
        NavigationLink(destination:RegisterUsernameView(email: $email))
        {
                ArrowButtonView()
            }
    }
}

struct RegisterEmailErrorButton: View {
    @Binding var errorDisplayed: Bool
    var body: some View {
        Button(action: ({
            self.errorDisplayed = true
        })){
            ArrowButtonView()
        }
    }
}


struct RegisterEmailErrorMessage: View {
    var body: some View {
        Text("Emails must match")
            .foregroundColor(.red)
            .padding(.bottom, Constants.verticalPadding)
    }
}
