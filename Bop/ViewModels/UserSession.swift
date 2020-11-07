//
//  LoginAndRegistration.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

// Handles authentication
class UserSession: ObservableObject {

    var user: UserAuth? = nil
    var authState: AuthStateDidChangeListenerHandle? = nil
    @Published var sessionState: UserAuth? = nil
    
    // Determine user login state
    func listenForAuthState() {
        authState = Auth.auth().addStateDidChangeListener( { (auth, user) in
            if let user = user {
                self.sessionState = UserAuth(uid: user.uid, email: user.email)
            }
            else {
                self.sessionState = nil
            }
        })
    }
    
    // User creation
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    // User authentication
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    // User log out
    func signOut() {
        do {            
            try Auth.auth().signOut()
            self.sessionState = nil
        }
        catch {
            print ("Error signing out")
        }
    }
    // Stop listener from running
    func stopListening() {
        if let authState = authState {
           Auth.auth().removeStateDidChangeListener(authState)
        }
    }
}


