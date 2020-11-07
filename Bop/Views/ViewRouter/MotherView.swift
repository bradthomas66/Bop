//
//  MotherView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-14.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "dashboard" {
                DashboardView(dataHandler: DataHandler())
            } else if viewRouter.currentPage == "contacts" {
                ContactsView()
            } else if viewRouter.currentPage == "conversationList" {
                ConversationList()
            } else if viewRouter.currentPage == "conversation" {
                ConversationView(recipientUsername: viewRouter.recipient, chatController: ChatController())
            } else {
                LaunchView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
