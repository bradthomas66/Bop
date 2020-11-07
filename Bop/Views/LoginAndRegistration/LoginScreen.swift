//
//  LoginScreen.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-29.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
       NavigationView {
            ZStack {
                Background()
                VStack {
                    Text ("Bop")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, Constants.verticalPadding)
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: LoginEntry()) {
                            Text("Log in")
                            .frame(width: Constants.frameWidth, height: 30)
                            .foregroundColor(Color.white)
                            .background(ColorManager.button)
                            .cornerRadius(30)
                        }
                        Spacer()
                        NavigationLink(destination: RegisterEmailView()) {
                            Text("Sign-up")
                            .frame(width: Constants.frameWidth, height: 50)
                            .foregroundColor(Color.white)
                            .cornerRadius(30)
                        }.padding(.bottom, Constants.verticalPadding)
                    }
                }
            }
        }
    }
}
struct UserNotPresentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
