//
//  RegisterNameView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct RegisterNameView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var errorDisplayed: Bool = false
    @Binding var username: String
    @Binding var email: String 
    
    var body: some View {
        ZStack {
            Background()
            VStack{
                NameTitleText()
                Spacer()
                FirstNameTextField(firstName: $firstName)
                textFieldLabeled (width: Constants.frameWidth, description: "FIRST NAME")
                LastNameTextField(lastName: $lastName)
                textFieldLabeled (width: Constants.frameWidth, description: "LAST NAME")
                Spacer()
                if !firstName.isEmpty && !lastName.isEmpty {
                    RegisterAgeNavLink(username: $username, email: $email, firstName: $firstName, lastName: $lastName)
                }
                else {
                    if errorDisplayed {
                        RegisterNameErrorMessage()
                    }
                    else {
                        Text("")
                            .padding(.bottom, Constants.verticalPadding)
                    }
                RegisterNameErrorButton(errorDisplayed: $errorDisplayed)
                }
            }
        }
    }
}

struct RegisterNameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNameView(username: .constant("Coolguy1"), email: .constant("test@gmail.com"))
    }
}

struct NameTitleText: View {
    var body: some View {
        Text("Who are you?")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding(.top, Constants.verticalPadding)
    }
}

struct FirstNameTextField: View {
    
    @Binding var firstName: String
    
    var body: some View {
        TextField("", text: $firstName)
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth*0.8, height: 30)
            .padding(.leading, Constants.verticalPadding/2)
            .offset(x: -30, y:10)
    }
}

struct LastNameTextField: View {
    
    @Binding var lastName: String
    
    var body: some View {
        TextField("", text: $lastName)
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth*0.8, height: 30)
            .padding(.leading, Constants.verticalPadding/2)
            .offset(x: -30, y:10)
    }
}

struct RegisterAgeNavLink: View {
    
    @Binding var username: String
    @Binding var email: String
    @Binding var firstName: String
    @Binding var lastName: String

    var body: some View {
        NavigationLink(destination: RegisterAgeView(email: $email, username: $username, firstName: $firstName, lastName: $lastName)){
            Image("WhiteArrow")
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
        }.padding(.bottom, Constants.verticalPadding)
    }
}

struct RegisterNameErrorButton: View {
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

struct RegisterNameErrorMessage: View {
    var body: some View {
        Text("First and last names can not be empty")
            .foregroundColor(.red)
            .padding(.bottom, Constants.verticalPadding)
    }
}
