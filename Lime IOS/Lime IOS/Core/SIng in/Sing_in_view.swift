//
//  ContentView.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 25.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var phone: String = ""
    @State private var pass: String = ""
    private var height: Int = Int(UIScreen.main.bounds.height)
    private var width: Int = Int(UIScreen.main.bounds.width)
    
    var body: some View {
        NavigationView{
            VStack {
                Image("Sing in imge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat(width) * 0.8, height: CGFloat(height) * 0.15)
                    .padding(.vertical, CGFloat(height) * 0.2)
                    .padding(.bottom, -CGFloat(width) * 0.25)
                NavigationLink(destination: Sing_up_view()){
                    HStack{
                        Image("Txt to sing up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(width) * 0.6,height: CGFloat(height) * 0.025)
                    }
                    
                }
                
                VStack(spacing: CGFloat(height) * 0.02){
                    InputView(text: $phone, title: "Телефон", plaseHolder: "")
                        .padding(.top,30)
                        .padding(.horizontal,CGFloat(width) * 0.15)
                    InputView(text: $pass, title: "Пароль", plaseHolder: "",isSecureField: true)
                        .padding(.horizontal,CGFloat(width) * 0.15)
                }
                NavigationLink{
                    
                }label:{
                    HStack{
                        Image("NewPass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: self.height <= 700 ? CGFloat(self.height) * 0.2 : CGFloat(self.height) * 0.15,height:self.height <= 700 ? CGFloat(self.height) * 0.02 : CGFloat(self.height) * 0.04)
                            .padding(.top,10)
                    }
                    
                }
                
                
                Spacer()
                SwipeButton(title: "Увійти")
                    .padding(.bottom, height <= 700 ? CGFloat(height) * 0.03 : CGFloat(height) * 0.05)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.0862745098, green: 0.0941176471, blue: 0.0941176471, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitle("", displayMode: .inline) // Пустой текст в качестве заголовка
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
