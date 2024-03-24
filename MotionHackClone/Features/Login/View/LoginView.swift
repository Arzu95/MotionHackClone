//
//  LoginView.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isHiddenPassword = true
    
    
    
    var body: some View {
        LoginView()
    }
}

extension LoginView{
    
    @ViewBuilder
    func LoginView() -> some View{
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 3){
                Text("Selamat Datang 👋🏻")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Text("AAA")
                    .fontWeight(.regular)
                    .font(.system(size: 14))
            }
            .padding(.bottom, 57)

            
            Text("Email")
                .fontWeight(.regular)
                .font(.system(size: 12))
            TextField("", text: $email)
                .keyboardType(.emailAddress)

            Divider()
            
            
            Text("Kata Sandi")
                .fontWeight(.regular)
                .font(.system(size: 12))
            SecureField("", text: $password)

            Divider()
                .padding(10)
            
            Button {
                
            } label: {
                Text("Lupa Kata Sandi?")
                    .fontWeight(.medium)
                    .font(.system(size: 12))
                    .padding(.top, 12)
            }
            
            Button {
                
            } label: {
                ZStack{
                    Text("Masuk")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .frame(width: 329, height: 45.4)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
            .padding(.top, 45.3)
            .padding(.leading)

            Divider()
                .padding(.top, 57)
            
        }
        .padding(15)
    }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
