//
//  ContactsView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-25.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    Button (action: {self.viewRouter.currentPage = "dashboard"}) {
                        MiniBackArrowButtonView()
                    }
                    Spacer()
                }
                ContactsTitleText()
                Spacer()
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

struct MiniBackArrowButtonView: View {
    var body: some View {
        Image("WhiteArrow").renderingMode(.original)
            .resizable()
            .frame(width: 35, height: 35)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .padding(.leading, 10)
    }
}

struct ContactsTitleText: View {
    var body: some View {
        Text("Contacts")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding()
    }
}
