//
//  ContentView.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 25.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Sing in imge")
                .resizable()
                .scaledToFit()
                .frame(width: 279, height: 114)
                .padding(.vertical, 92)
                Spacer()
            
                //douwn button
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(#colorLiteral(red: 0.0862745098, green: 0.0941176471, blue: 0.0941176471, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
