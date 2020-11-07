//
//  UserDatabase.swift
//  Bop
//
//  Created by Brad Thomas on 2020-08-15.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation

// Queries data from the database
class UserDatabaseQuery: ObservableObject {
    
    @Published var user: User
    
    init (user: User) {
        self.user = user
    }
    
    func getUserDataByUsername (username: String) {
        userDatabaseRoot.queryOrdered(byChild: "username")
            .queryEqual(toValue: username)
            .observeSingleEvent(of: .value, with: {(snapshot) in
                if !snapshot.exists() {
                    print (username)
                    print ("Username does not exist")
                }
                else {
                    let data = snapshot.value as? NSDictionary
                    self.user.username = data?["username"] as? String ?? ""
                    self.user.firstName = data?["firstName"] as? String ?? ""
                    self.user.lastName = data?["lastName"] as? String ?? ""
                    self.user.birthday = data?["birthday"] as? String ?? ""
                    self.user.email = data?["email"] as? String ?? ""
                    self.user.authId = data?["authId"] as? String ?? ""
                 }
            })
    }
    
    func getUserDataById (id: String) {
        userDatabaseRoot.queryOrderedByKey()
            .queryEqual(toValue: id)
            .observeSingleEvent(of: .value, with: {(snapshot) in
                if !snapshot.exists() {
                    print (id)
                    print ("ID does not exist")
                }
                else {
                    let user = snapshot.value as? NSDictionary
                    let data = user?[id] as? NSDictionary
                    self.user.username = data?["username"] as? String ?? ""
                    self.user.firstName = data?["firstName"] as? String ?? ""
                    self.user.lastName = data?["lastName"] as? String ?? ""
                    self.user.birthday = data?["birthday"] as? String ?? ""
                    self.user.email = data?["email"] as? String ?? ""
                    self.user.authId = data?["authId"] as? String ?? ""
                }
            })
    }
}
