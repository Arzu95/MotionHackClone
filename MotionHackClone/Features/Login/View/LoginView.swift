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
        VStack {
            VStack(alignment: .leading, spacing: 3){
                Text("Selamat Datang 👋🏻")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Text("AAA")
                    .fontWeight(.regular)
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 57)
            
            VStack(alignment: .leading){
                Text("Email")
                    .fontWeight(.regular)
                    .font(.system(size: 12))
                TextField("", text: $email)
                    .keyboardType(.emailAddress)
                
                Divider()
                    .foregroundColor(Color.blue)
            }

            
            VStack(alignment: .leading){

                Text("Kata Sandi")
                    .fontWeight(.regular)
                    .font(.system(size: 12))
                SecureField("", text: $password)
                
                Divider()
                    .foregroundColor(Color.blue)
            }
            .padding(.top, 21)
            
            VStack(alignment: .trailing){
                Button {
                    
                } label: {
                    Text("Lupa Kata Sandi?")
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
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
            
            
            HStack(spacing: 16){
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(LocalColor.grayy)
                Text("atau daftar dengan")
                    .fontWeight(.regular)
                    .font(.system(size: 11))
                    .foregroundColor(LocalColor.grayy)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(LocalColor.grayy)
            }
            .padding(.top, 70)
            
            HStack(spacing: 17){
                Button {
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 128, height: 57)
                            .foregroundColor(.white)
                            .shadow(radius: 4, x: 0, y: 4)
                        HStack{
                            Image("icon-google")
                            Text("Google")
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                        }
                    }
                }

                Button {
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 128, height: 57)
                            .foregroundColor(.white)
                            .shadow(radius: 4, x: 0, y: 4)
                        HStack{
                            Image("icon-facebook")
                            Text("Facebook")
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                        }
                    }
                }
            }
            .padding(.top, 29)
            HStack{
                Text("Belum memiliki akun?")
                    .fontWeight(.regular)
                    .font(.system(size: 14))
                Text("Daftar")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(LocalColor.bluee)
            }
            .padding(.top, 37)
            
            Image.logo
                .padding(.top, 18)
            
        }
        
        .padding(15)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
