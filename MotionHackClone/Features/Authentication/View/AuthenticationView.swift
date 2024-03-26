//
//  SignUpView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI
import GoogleSignInSwift

struct AuthenticationView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some View {
        NavigationStack {
            if (viewModel.isSignUpView == true) {
                ScrollView {
                    VStack {
                        VStack {
                            UnderlineTextField(text: $viewModel.fieldNama, title: "Nama")
                                .padding(.top)
                            UnderlineTextField(text: $viewModel.fieldEmail, title: "Email")
                                .padding(.top)
                                .textInputAutocapitalization(.never)
                            UnderlineSecureField(text: $viewModel.fieldPasssword, title: "Kata Sandi", isVisible: viewModel.isVisiblePassword, action: {viewModel.isVisiblePassword.toggle()})
                            UnderlineSecureField(text: $viewModel.fieldConfirmPassword,
                                                 title: "Konfirmasi Kata Sandi",
                                                 isVisible: viewModel.isVisibleConfirm, action: {viewModel.isVisibleConfirm.toggle()})
                            .padding(.top)
                        }

                        ButtonPrimary(title: "Daftar", action: {
                            viewModel.signUpUser()
                        })
                        .padding(.bottom, 48)
                        Image.or_with
                        HStack(spacing: 17){
                            Button {
                                Task {
                                    do {
                                        try await viewModel.googleSignIn()
                                    } catch let e {
                                        print(e.localizedDescription)
                                    }
                                }
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
                            Button(action: {
                                viewModel.isSignUpView.toggle()
                            }, label: {
                                Text("Login")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(LocalColor.blue)
                            })
                        }
                        .padding(.top, 37)
                    }
                    .padding(.horizontal, 30)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            VStack(alignment: .leading) {
                                Text("Daftarkan diri,")
                                    .font(.system(size: 22))
                                    .bold()
                                Text("Masukan data diri kamu")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black.opacity(0.55))
                            }
                            .padding()
                            .padding(.top, 20)
                        }
                    }
                    .onAppear {
                        
                    }
                }
            } else {
                VStack {
                    VStack(alignment: .leading, spacing: 3){
                        Text("Selamat Datang 👋🏻")
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                        Text("Masuk untuk melanjutkan menggunakan Aplikasi ini")
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 57)
                    
                    UnderlineTextField(text: $viewModel.fieldEmail, title: "Email")
                        .textInputAutocapitalization(.never)
                    UnderlineSecureField(
                        text: $viewModel.fieldPassswordLogin,
                        title: "Kata Sandi",
                        isVisible: viewModel.isVisiblePassword,
                        action: {viewModel.isVisiblePassword.toggle()})
                    
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
                        viewModel.signInUser()
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
                        Button(action: {
                            viewModel.isSignUpView.toggle()
                        }, label: {
                            Text("Daftar")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(LocalColor.bluee)
                        })
                    }
                    .padding(.top, 37)
                    Image.logo
                        .padding(.top, 18)
                }
                .padding(15)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
