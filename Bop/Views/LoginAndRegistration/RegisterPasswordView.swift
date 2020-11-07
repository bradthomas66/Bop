//
//  RegisterPasswordView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI
import Firebase

struct RegisterPasswordView: View {
    
    @State private var password: String = ""
    @State private var retypePassword: String = ""
    @State private var error: String = ""
    @State private var errorDisplayed: Bool = false
    @EnvironmentObject var userSession: UserSession
    @Binding var email: String
    @Binding var username: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var birthday: String
    
    func signUp () {
        userSession.signUp(email: email ,password: password)
        { (result, error) in
            if let error = error {
                print(error)
                self.error = error.localizedDescription
            }
            else {
                self.writeUserToDatabase(
                    username: self.username,
                    email: self.email,
                    firstName: self.firstName,
                    lastName: self.lastName,
                    birthday: self.birthday,
                    /*dateJoined: Date()*/
                    authId: Auth.auth().currentUser?.uid ?? ""
                )
                self.password = ""
            }
        }
    }
    
    func writeUserToDatabase (username: String,
                              email: String,
                              firstName: String,
                              lastName: String,
                              birthday: String,
                              /*dateJoined: Date*/
                              authId: String) {
        let newUser = userDatabaseRoot.childByAutoId()
        let userInfo = ["username": username,
                        "email": email,
                        "firstName": firstName,
                        "lastName": lastName,
                        "birthday": birthday,
                        /*"dateJoined": dateJoined*/
                        "authId": authId] as [String : String]
        newUser.setValue(userInfo)
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack{
                Group {
                    PasswordTitleText()
                    Spacer()
                    SecureField("", text: $password)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(width: Constants.frameWidth*0.8, height: 30)
                        .padding(.leading)
                        .offset(x: -30, y:10)
                    textFieldLabeled (width: Constants.frameWidth, description: "PASSWORD")
                    SecureField("", text: $retypePassword)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(width: Constants.frameWidth*0.8, height: 30)
                        .padding(.leading)
                        .offset(x: -30, y:10)
                    textFieldLabeled (width: Constants.frameWidth, description: "RETYPE PASSWORD")
                    Spacer()
                    Text(error)
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    if password == retypePassword && password.isEmpty != true {
                        Button(action: signUp) {
                            ArrowButtonView()
                        }.padding(.bottom, Constants.verticalPadding)
                    }
                    else {
                        if errorDisplayed {
                            RegisterPasswordErrorMessage()
                        }
                        else {
                            Text("")
                                .padding(.bottom, Constants.verticalPadding)
                        }
                        RegisterPasswordErrorButton(errorDisplayed: $errorDisplayed)
                    }
                    
                }
            }
        }
    }
}

struct RegisterPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPasswordView(email: .constant("test@gmail.com"), username: .constant("Coolguy1"), firstName: .constant("Brad"), lastName: .constant("Thomas"), birthday: .constant("March 11, 2020"))
    }
}

struct PasswordTitleText: View {
    var body: some View {
        Text("Set a password")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding(.top, Constants.verticalPadding)
    }
}

struct RegisterPasswordErrorButton: View {
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


struct RegisterPasswordErrorMessage: View {
    var body: some View {
        Text("Passwords must match")
            .foregroundColor(.red)
            .padding(.bottom, Constants.verticalPadding)
    }
}
