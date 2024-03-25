//
//  LoginViewModel.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isHiddenPassword = true
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            fatalError("No Email and Password Found")
        }
        
        Task {
            do {
                let userData = try await Authentication.shared.signInUser(email: email, password: password)
                print("Succes Sign In")
                print(userData)
            } catch {
                print("Error : \(error)")
            }
        }
    }
}
