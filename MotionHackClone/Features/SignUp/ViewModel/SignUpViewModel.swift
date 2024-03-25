//
//  SignUpViewModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import Foundation
import AuthenticationServices
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class SignUpViewModel : ObservableObject{
    @Published var fieldNama: String = ""
    @Published var fieldEmail: String = ""
    @Published var fieldPasssword: String = ""
    @Published var fieldConfirmPassword: String = ""
    @Published var isVisiblePassword: Bool = true
    @Published var isVisibleConfirm: Bool = true
    
    var confirmPassword: Bool = false
    
    func signUp() {
        guard !fieldEmail.isEmpty, !fieldPasssword.isEmpty else {
            fatalError("No Email and Password Found")
        }
        
        Task {
            do {
                let userData = try await Authentication.shared.signUpUser(email: fieldEmail, password: fieldPasssword)
                print("Succes Sign Up")
                print(userData)
            } catch {
                print("Error : \(error)")
            }
        }
    }
    
    func googleSignIn() async throws {
    
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("no firbase clientID found")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let rootViewController = await scene?.windows.first?.rootViewController
        else {
            fatalError("There is no root view controller!")
        }
        
        let result = try await GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController
        )
        let user = result.user
        guard let idToken = user.idToken?.tokenString else {
            throw "Unexpected error occurred, please retry"
        }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken, accessToken: user.accessToken.tokenString
        )
        try await Auth.auth().signIn(with: credential)
    }
    
    func googleSignOut() async throws {
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
}

extension String: Error {}
