//
//  Sing_up_view.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 25.11.2023.
//

import SwiftUI

struct Sing_up_view: View {
    @State private var name: String = ""
    @State private var date: String = ""
    @State private var phone: String = ""
    @State private var pass: String = ""
    @State private var repass: String = ""
    private var height: Int = Int(UIScreen.main.bounds.height)
    private var width: Int = Int(UIScreen.main.bounds.width)
    var body: some View {
        VStack{
            Image("Sing up")
                .frame(width: CGFloat(width) * 0.8, height: CGFloat(height) * 0.15)
                .padding(.vertical, 60)
                .padding(.bottom, -CGFloat(width) * 0.15)
            
            VStack(spacing: 30)  {
                InputView(text: $name, title: "Прізвище та ім'я", plaseHolder: "")
                    .padding(.horizontal,CGFloat(width) * 0.15)
                InputView(text: $date, title: "Дата народження", plaseHolder: "")
                    .padding(.horizontal,CGFloat(width) * 0.15)
                InputView(text: $phone, title: "Телефон", plaseHolder: "")
                    .padding(.horizontal,CGFloat(width) * 0.15)
                InputView(text: $pass, title: "Пароль", plaseHolder: "", isSecureField: true)
                    .padding(.horizontal,CGFloat(width) * 0.15)
                InputView(text: $repass, title: "Підтвердіть ваш пароль", plaseHolder: "",isSecureField: true)
                    .padding(.horizontal,CGFloat(width) * 0.15)
                
                NavigationLink{
                    
                }label:{
                    HStack{
                        Image("Txt to sing in")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(width) * 0.6,height: CGFloat(height) * 0.019)
                            .padding(.top,10)
                    }
                    
                }
            }
            Spacer()
            SwipeButton(title: "Sign up")
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(#colorLiteral(red: 0.0862745098, green: 0.0941176471, blue: 0.0941176471, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    Sing_up_view()
}
