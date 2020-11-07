//
//  DashboardView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI
import Firebase

struct DashboardView: View {
    
    @EnvironmentObject var userSession: UserSession
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var dataHandler: DataHandler
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    Button (action: {self.userSession.signOut()}) {
                        UserIcon()
                    }
                    Spacer()
                    DashboardTitleText()
                    Spacer()
                    Button (action: {self.viewRouter.currentPage = "contacts"}) {
                        ContactIcon()
                    }
                }
                ScrollView(.vertical) {
                    ForEach (dataHandler.dataWithSize, id: \.self) { row in
                        Bubble(content: row.content, number: row.value, size: row.size)
                    }
                }
                Button (action: {dataHandler.dataWithValue.append(MessageBubble(content: "👽", value: 1.0, size: 1.0))}) {
                    BopButtonView()
                }.padding (.bottom, Constants.verticalPadding)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(dataHandler: DataHandler())
    }
}

struct DashboardTitleText: View {
    var body: some View {
        Text("Bop")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .frame(width: Constants.frameWidth, height: 50)
            .padding()
    }
}


struct UserIcon: View {
    var body: some View {
        Image(systemName: "person.badge.minus")
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .font(.title)
            .padding()
    }
}

struct ContactIcon: View {
    var body: some View {
        Image(systemName: "rectangle.stack.person.crop")
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .font(.title)
            .padding(.trailing, 15)
    }
}

struct BopButtonView: View {
    var body: some View {
        Circle()
            .foregroundColor(ColorManager.button)
            .frame(width: 60, height: 60)
    }
}
