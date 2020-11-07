//
//  LaunchView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var userSession: UserSession
    @EnvironmentObject var viewRouter: ViewRouter
    
    func listenForUser() {
        userSession.listenForAuthState()
    }
    
    var body: some View {
        Group {
            if (userSession.sessionState != nil) {
                DashboardView(dataHandler: DataHandler())
            }
            else {
                LoginScreen()
            }
        }.onAppear(perform: listenForUser)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(UserSession())
    }
}
