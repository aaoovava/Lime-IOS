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
        NavigationView{
            VStack{
                Image("Sing up")
                    .frame(width: CGFloat(width) * 0.8, height: CGFloat(height) * 0.09)
                    .padding(.vertical, CGFloat(height) * 0.1)
                    .padding(.bottom, -CGFloat(width) * 0.15)
                
                VStack(spacing: CGFloat(height) * 0.02)  {
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
                    
                    NavigationLink(destination: ContentView()){
                    
                        HStack{
                            Image("Txt to sing in")
                                .resizable()
                                .scaledToFit()
                                .frame(width: self.height <= 700 ? CGFloat(self.height) * 0.2 : CGFloat(self.height) * 0.15,height:self.height <= 700 ? CGFloat(self.height) * 0.022 : CGFloat(self.height) * 0.04)
                                .padding(.top,10)
                        }
            
                       
                    }
                }
                Spacer()
                SwipeButton(title: "Sign up")
                    .padding(.bottom, height <= 700 ? CGFloat(height) * 0.03 : CGFloat(height) * 0.05)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.0862745098, green: 0.0941176471, blue: 0.0941176471, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationBarTitle("", displayMode: .inline) // Пустой текст в качестве заголовка
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Sing_up_view()
}
