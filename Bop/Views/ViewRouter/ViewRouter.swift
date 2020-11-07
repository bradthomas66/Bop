//
//  ViewRouter.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-14.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: String = ""
    var recipient: String = ""
    var senderId: String = ""
    
    init(pageToStartWith: String) {
        currentPage = pageToStartWith
    }
}
