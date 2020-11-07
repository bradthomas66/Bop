//
//  ConversationLine.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-17.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ConversationLine: View {
    
    @State private var nameOfContact: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(nameOfContact)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                textFieldLine(width: 230)
            }.padding(.leading, 40)
            Spacer()
        }
    }
}

struct BopversationLine_Previews: PreviewProvider {
    static var previews: some View {
        ConversationLine(nameOfContact: "Brad Thomas")
    }
}
