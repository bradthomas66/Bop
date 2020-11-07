//
//  ForgotPasswordView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    var body: some View {
            ZStack {
                Background()
                VStack {
                    ForgotPasswordTitleText()
                    Spacer()
                    VStack {
                        ForgotPasswordBodyText()
                    }
                    Spacer()
                    VStack {
                        EmailTextField(email: $email)
                        textFieldLabeled (width: Constants.frameWidth, description: "EMAIL")
                        Spacer()
                    }.padding(.top)
                }
            }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

struct ForgotPasswordTitleText: View {
    var body: some View {
        Text ("Forgot your password?")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.top, Constants.verticalPadding)
    }
}

struct ForgotPasswordBodyText: View {
    var body: some View {
        Text ("No worries, just type in the email associated with your account and we'll send you a new one.")
            .font(.subheadline)
            .fontWeight(.light)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth)
            .padding(.top, Constants.verticalPadding)
            .padding(.bottom,Constants.verticalPadding)
    }
}
