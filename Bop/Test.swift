//
//  Test.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-06.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct Test: View {
    
    @State var username: String = ""
    
    var body: some View {
        ZStack {
            
            Background()
            
            VStack {
                TextField("", text: $username)
                    .offset(y: 8)
                    .frame(width: frameWidth, height: 50, alignment: .bottomLeading)
                    .foregroundColor(Color.white)

                textFieldLine(width: frameWidth)

                HStack {
                    Text("USERNAME")
                        .font(.footnote)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .frame(width:frameWidth, alignment: .topLeading)
                        .padding ([.leading, .bottom])
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
