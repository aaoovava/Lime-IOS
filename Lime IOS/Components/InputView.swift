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
    
    struct CustomTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .foregroundColor(Color(red: 0.5, green: 0.98, blue: 0.53))
                .accentColor(Color(red: 0.5, green: 0.98, blue: 0.53))
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(title)
                .foregroundColor(Color(red: 0.3, green: 0.34, blue: 0.4))
                .font(.custom("Inter-Regular", size:15))
            if isSecureField{
                ZStack(alignment: .leading){
                    Image("Input")
                        .resizable()
                        .frame(width: 324,height: 44)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    SecureField(plaseHolder, text: $text)
                        .foregroundColor(Color(red: 0.5, green: 0.98, blue: 0.53))
                        .font(.custom("Inter-Regular", size:18))
                        .padding(.horizontal,15)
                        .accentColor(Color(red: 0.5, green: 0.98, blue: 0.53))
                }
                
            }else{
                ZStack(alignment: .leading){
                    Image("Input")
                        .resizable()
                        .frame(width: 324,height: 44)
                        .edgesIgnoringSafeArea(.all)
                    
                    TextField(plaseHolder, text: $text)
                        .foregroundColor(Color(red: 0.5, green: 0.98, blue: 0.53))
                        .font(.custom("Inter-Regular", size:18))
                        .padding(.horizontal,15)
                        .accentColor(Color(red: 0.5, green: 0.98, blue: 0.53))
                        
                }
                
                
            }
        }
        
    }
    }


#Preview {
    InputView(text: .constant(""), title: "Телефон", plaseHolder:"")
}
