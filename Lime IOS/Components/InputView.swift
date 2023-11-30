//
//  InputView.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 30.11.2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let plaseHolder: String
    var isSecureField = false
    
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(Color(red: 0.3, green: 0.34, blue: 0.4))
                .font(.custom("Inter-Regular", size:40))
        
        }}
    }


#Preview {
    InputView(text: .constant(""), title: "1", plaseHolder:"0960504238")
}
