//
//  RegisterAgeView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct RegisterAgeView: View {
    
    @State private var errorDisplayed: Bool = false
    @Binding var email: String
    @Binding var username: String
    @Binding var firstName: String
    @Binding var lastName: String
    @ObservedObject var selectionChange = SelectionChange();
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Text("How old are you?")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .frame(width: Constants.frameWidth, height: 50)
                    .padding (.top, Constants.verticalPadding)
                Spacer()
                Group {
                    DatePicker("", selection: $selectionChange.birthday, displayedComponents: .date)
                        .foregroundColor(.white)
                        .labelsHidden()
                }
                .colorInvert()
                .colorMultiply(ColorManager.button)
                Spacer()
                RegisterPasswordNavLink(birthday: $selectionChange.birthdayString, email: $email, username: $username, firstName: $firstName, lastName: $lastName)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAgeView(email: .constant("test@gmail.com"), username: .constant("Coolguy1"), firstName: .constant("Brad"), lastName: .constant("Thomas"))
    }
}

struct RegisterPasswordNavLink: View {
    
    @Binding var birthday: String
    @Binding var email: String
    @Binding var username: String
    @Binding var firstName: String
    @Binding var lastName: String
    
    var body: some View {
        NavigationLink(destination: RegisterPasswordView(email: $email, username: $username, firstName: $firstName, lastName: $lastName, birthday: $birthday))
        {
            ArrowButtonView()
        }
    }
}
