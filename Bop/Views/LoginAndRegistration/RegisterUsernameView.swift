//
//  RegisterUsernameView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct RegisterUsernameView: View {
    
    @State private var username: String = ""
    @Binding var email: String
    @State private var errorDisplayed: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            VStack{
                Group {
                    UsernameTitleText()
                    Spacer()
                    Group {
                        UsernameTextField(username: $username)
                        textFieldLabeled (width: Constants.frameWidth, description: "USERNAME")
                    }
                    Spacer()
                    if username.isEmpty != true {
                        RegisterNameNavLink(email: $email, username: $username)
                    }
                    else {
                        if errorDisplayed {
                            RegisterUsernameErrorMessage()
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

struct RegisterUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUsernameView(email: .constant("test@gmail.com"))
    }
}

struct UsernameTitleText: View {
    var body: some View {
        Text("Create a username")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding(.top, Constants.verticalPadding)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("", text: $username)
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth*0.8, height: 30)
            .padding(.leading)
            .offset(x: -30, y:10)
    }
}

struct RegisterNameNavLink: View {
    @Binding var email: String
    @Binding var username: String
    var body: some View {
        NavigationLink(destination: RegisterNameView(username: $username, email: $email)){
            Image("WhiteArrow").renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.bottom, Constants.verticalPadding)
        }
    }
}

struct RegisterUsernameErrorButton: View {
    @Binding var errorDisplayed: Bool
    var body: some View {
        Button(action: ({
            self.errorDisplayed = true
        }))
        {
            ArrowButtonView()
        }
    }
}


struct RegisterUsernameErrorMessage: View {
    var body: some View {
        Text("Username can not be empty")
            .foregroundColor(.red)
            .padding(.bottom, Constants.verticalPadding)
    }
}
