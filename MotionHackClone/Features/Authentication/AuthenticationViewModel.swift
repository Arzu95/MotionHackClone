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
import SwiftUI

class AuthenticationViewModel : ObservableObject{
    @Published var fieldNama: String = ""
    @Published var fieldEmail: String = ""
    @Published var fieldPassswordLogin: String = ""
    @Published var fieldPasssword: String = ""
    @Published var fieldConfirmPassword: String = ""
    @Published var isVisiblePassword: Bool = true
    @Published var isVisibleConfirm: Bool = true
    @Published var errorMessage: String = ""
    @AppStorage("isAuthenticated") var isAuthenticated = false
    @Published var isSignUpView = false
    @Published var user: User?
    
    var confirmPassword: Bool = false
    
    private let authRepo: AuthRepository
    
    init(authRepo: AuthRepository = AuthDefaultRepository()) {
        self.authRepo = authRepo
    }
    
    func signUpUser() {
        authRepo.signUp(with: fieldEmail, password: fieldNama, completion: { [weak self ] error in
            DispatchQueue.main.async {
                self?.errorMessage = "\(error?.localizedDescription)"
                self?.signInUser()
            }
        })
    }
    
    func signInUser() {
        authRepo.login(with: fieldEmail, password: fieldPasssword, completion: { [weak self] error in
            DispatchQueue.main.async { [weak self] in
                withAnimation {
                    self?.isAuthenticated = true
                }
                print(self?.isAuthenticated)
                self?.errorMessage = "\(error?.localizedDescription)"
            }
        })
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
        self.isAuthenticated = false
    }
}

extension String: Error {}
